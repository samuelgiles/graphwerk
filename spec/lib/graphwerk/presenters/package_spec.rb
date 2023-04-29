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

        let(:deprecated_references_loader) { instance_double(DeprecatedReferencesLoader) }

        before do
          expect(DeprecatedReferencesLoader)
            .to receive(:new)
            .with(package, root_path)
            .and_return(deprecated_references_loader)
          expect(deprecated_references_loader).to receive(:load).and_return(['.'])
        end

        it { is_expected.to contain_exactly('Application') }
      end

      describe '#todos' do
        subject { presenter.todos }

        let(:package_todo_loader) { instance_double(PackageTodoLoader) }

        before do
          expect(PackageTodoLoader)
            .to receive(:new)
            .with(package, root_path)
            .and_return(package_todo_loader)
          expect(package_todo_loader).to receive(:load).and_return(['.'])
        end

        it { is_expected.to contain_exactly('Application') }
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
