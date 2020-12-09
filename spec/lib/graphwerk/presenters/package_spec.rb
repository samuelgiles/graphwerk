# typed: false
# frozen_string_literal: true

module Graphwerk
  module Presenters
    describe Package do
      let(:presenter) { described_class.new(package, root_path) }

      let(:package) { child_package }
      let(:root_path) { Pathname.new('.') }

      let(:child_package) do
        Packwerk::Package.new(
          name: 'components/admin',
          config: { 'dependencies' => ['components/security', 'components/orders'] }
        )
      end
      let(:root_package) do
        Packwerk::Package.new(
          name: '.',
          config: { 'dependencies' => ['components/admin'] }
        )
      end

      describe '#name' do
        subject { presenter.name }

        context 'when the package is the root package' do
          let(:package) { root_package }

          it { is_expected.to eq 'Application' }
        end

        context 'when the package is not the root package' do
          let(:package) { child_package }

          it { is_expected.to eq 'admin' }
        end
      end

      describe '#dependencies' do
        subject { presenter.dependencies }

        it { is_expected.to eq ['security', 'orders'] }
      end

      describe '#deprecated_references' do
        subject { presenter.deprecated_references }

        let(:deprecated_references_file) { instance_double(Pathname) }

        before do
          expect(root_path)
            .to receive(:join)
            .with('components/admin', 'deprecated_references.yml')
            .and_return(deprecated_references_file)
          expect(deprecated_references_file)
            .to receive(:exist?)
            .and_return(deprecated_dependency_file_is_present)
        end

        context 'when no deprecated dependency file is present' do
          let(:deprecated_dependency_file_is_present) { false }

          it { is_expected.to be_empty }
        end

        context 'when a deprecated dependency file is present' do
          let(:deprecated_dependency_file_is_present) { true }

          before do
            expect(YAML)
              .to receive(:load_file)
              .with(deprecated_references_file)
              .and_return(
                '.' => {
                  "::Order" => {
                    "violations" => ["dependency"],
                    "files" => ["components/admin/interfaces/gateway.rb"]
                  }
                }
              )
          end

          it { is_expected.to contain_exactly('Application') }
        end
      end

      describe '#color' do
        subject { presenter.color }

        context 'when the package is the root package' do
          let(:package) { root_package }

          it { is_expected.to eq 'black' }
        end

        context 'when the package is not the root package' do
          let(:package) { child_package }

          it { is_expected.to eq 'azure4' }
        end
      end
    end
  end
end
