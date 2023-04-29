# typed: false
# frozen_string_literal: true

module Graphwerk
  describe PackageTodoLoader do
    let(:service) { described_class.new(package, root_path) }

    let(:package) do
      Packwerk::Package.new(
        name: 'components/admin',
        config: { 'dependencies' => ['components/security', 'components/orders'] }
      )
    end
    let(:root_path) { Pathname.new('.') }

    describe '#load' do
      subject { service.load }

      let(:package_todo_file) { instance_double(Pathname) }

      before do
        expect(root_path)
          .to receive(:join)
          .with('components/admin', 'package_todo.yml')
          .and_return(package_todo_file)
        expect(package_todo_file)
          .to receive(:exist?)
          .and_return(package_todo_file_is_present)
      end

      context 'when no deprecated dependency file is present' do
        let(:package_todo_file_is_present) { false }

        it { is_expected.to be_empty }
      end

      context 'when a deprecated dependency file is present' do
        let(:package_todo_file_is_present) { true }

        before do
          expect(YAML)
            .to receive(:load_file)
            .with(package_todo_file)
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
  end
end
