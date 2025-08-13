# typed: false
# frozen_string_literal: true

module Graphwerk
  module Builders
    describe Graph do
      let(:builder) { described_class.new(package_set) }

      let(:package_set) { Packwerk::PackageSet.new(packages) }
      let(:packages) { [root_package, frontend_package, admin_package, images_package, s3_package] }

      let(:root_package) do
        Packwerk::Package.new(
          name: '.',
          config: {
            'dependencies' => ['components/frontend', 'components/admin']
          }
        )
      end
      let(:admin_package) do
        Packwerk::Package.new(
          name: 'components/admin',
          config: {}
        )
      end
      let(:frontend_package) do
        Packwerk::Package.new(
          name: 'components/frontend',
          config: {
            'dependencies' => ['components/images']
          }
        )
      end
      let(:images_package) do
        Packwerk::Package.new(
          name: 'components/images',
          config: {
            'dependencies' => ['components/storage_providers/s3']
          }
        )
      end
      let(:s3_package) do
        Packwerk::Package.new(
          name: 'components/storage_providers/s3',
          config: {}
        )
      end

      describe '#build' do
        subject(:diagram) { builder.build.to_s }

        let(:deprecated_references_loader_for_images) do
          instance_double(DeprecatedReferencesLoader, load: ['.'])
        end

        let(:package_todo_loader_for_frontend) do
          instance_double(PackageTodoLoader, load: ['components/storage_providers/s3'])
        end

        before do
          allow(DeprecatedReferencesLoader).to receive(:new).and_call_original
          allow(DeprecatedReferencesLoader)
            .to receive(:new)
            .with(images_package, an_instance_of(Pathname))
            .and_return(deprecated_references_loader_for_images)
          allow(PackageTodoLoader).to receive(:new).and_call_original
          allow(PackageTodoLoader)
            .to receive(:new)
            .with(frontend_package, an_instance_of(Pathname))
            .and_return(package_todo_loader_for_frontend)
        end

        specify do
          expect(diagram).to eq <<~DOT
            digraph "strict" {
            Application [style = "filled", fillcolor = "#333333", fontcolor = "white", label = "Application", color = "black"];
            root = "Application";
            overlap = "false";
            splines = "true";
            node[ shape  =  "box" , style  =  "rounded, filled" , fontcolor  =  "white" , fillcolor  =  "#EF673E" , color  =  "#EF673E" , fontname  =  "Lato"];
            edge[ len  =  "0.4"];
            "storage_providers/s3" [color = "azure4", label = "storage_providers/s3"];
            frontend [color = "azure4", label = "frontend"];
            images [color = "azure4", label = "images"];
            admin [color = "azure4", label = "admin"];
              frontend -> images [color = "azure4"];
              frontend -> "storage_providers/s3" [color = "red"];
              images -> "storage_providers/s3" [color = "azure4"];
              images -> Application [color = "red"];
              Application -> frontend [color = "black"];
              Application -> admin [color = "black"];
            }
          DOT
        end

        context 'when a package depends on the root' do
          let(:frontend_package) do
            Packwerk::Package.new(
              name: 'components/frontend',
              config: {
                'dependencies' => ['components/images', '.']
              }
            )
          end

          specify do
            expect(diagram).to eq <<~DOT
              digraph "strict" {
              Application [style = "filled", fillcolor = "#333333", fontcolor = "white", label = "Application", color = "black"];
              root = "Application";
              overlap = "false";
              splines = "true";
              node[ shape  =  "box" , style  =  "rounded, filled" , fontcolor  =  "white" , fillcolor  =  "#EF673E" , color  =  "#EF673E" , fontname  =  "Lato"];
              edge[ len  =  "0.4"];
              "storage_providers/s3" [color = "azure4", label = "storage_providers/s3"];
              frontend [color = "azure4", label = "frontend"];
              images [color = "azure4", label = "images"];
              admin [color = "azure4", label = "admin"];
                frontend -> images [color = "azure4"];
                frontend -> Application [color = "azure4"];
                frontend -> "storage_providers/s3" [color = "red"];
                images -> "storage_providers/s3" [color = "azure4"];
                images -> Application [color = "red"];
                Application -> frontend [color = "black"];
                Application -> admin [color = "black"];
              }
            DOT
          end
        end

        context 'when hiding todos' do
          let(:builder) { described_class.new(package_set, options: { hide_todo: true }) }

          specify do
            expect(diagram).to eq <<~DOT
            digraph "strict" {
            Application [style = "filled", fillcolor = "#333333", fontcolor = "white", label = "Application", color = "black"];
            root = "Application";
            overlap = "false";
            splines = "true";
            node[ shape  =  "box" , style  =  "rounded, filled" , fontcolor  =  "white" , fillcolor  =  "#EF673E" , color  =  "#EF673E" , fontname  =  "Lato"];
            edge[ len  =  "0.4"];
            "storage_providers/s3" [color = "azure4", label = "storage_providers/s3"];
            frontend [color = "azure4", label = "frontend"];
            images [color = "azure4", label = "images"];
            admin [color = "azure4", label = "admin"];
              frontend -> images [color = "azure4"];
              images -> "storage_providers/s3" [color = "azure4"];
              Application -> frontend [color = "black"];
              Application -> admin [color = "black"];
            }
          DOT
          end
        end
      end
    end
  end
end
