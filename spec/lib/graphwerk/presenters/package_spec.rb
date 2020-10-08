# typed: false
# frozen_string_literal: true

module Graphwerk
  module Presenters
    describe Package do
      let(:presenter) { described_class.new(package) }

      let(:package) { child_package }

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
