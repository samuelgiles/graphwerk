# typed: false
# frozen_string_literal: true

module Graphwerk
  describe Loader do
    let(:service) { described_class.new(package, root_path, filename) }

    let(:package) do
      Packwerk::Package.new(
        name: 'components/admin',
        config: { 'dependencies' => ['components/security', 'components/orders'] }
      )
    end
    let(:root_path) { Pathname.new('.') }

    shared_examples 'a YAML loader' do
      describe '#load' do
        subject { service.load }

        let(:file) { instance_double(Pathname) }

        before do
          expect(root_path)
            .to receive(:join)
            .with('components/admin', filename)
            .and_return(file)
          expect(file)
            .to receive(:exist?)
            .and_return(file_is_present)
        end

        context 'when no file is present' do
          let(:file_is_present) { false }

          it { is_expected.to be_empty }
        end

        context 'when a file is present' do
          let(:file_is_present) { true }

          before do
            expect(YAML)
              .to receive(:safe_load_file)
              .with(file)
              .and_return(
                '.' => {
                  "::Order" => {
                    "violations" => ["dependency"],
                    "files" => ["components/admin/interfaces/gateway.rb"]
                  }
                }
              )
          end

          it { is_expected.to contain_exactly('.') }
        end
      end

      describe '#load with a real YAML fixture file' do
        let(:root_path) { Pathname.new(File.expand_path('../../support/fixtures', __dir__)) }

        it 'parses the file with safe_load_file and returns the keys' do
          expect(service.load).to contain_exactly('.', 'components/shipping')
        end
      end
    end

    context 'with deprecated_references.yml' do
      let(:filename) { 'deprecated_references.yml' }

      it_behaves_like 'a YAML loader'
    end

    context 'with package_todo.yml' do
      let(:filename) { 'package_todo.yml' }

      it_behaves_like 'a YAML loader'
    end
  end
end
