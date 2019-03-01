require 'rails_helper'

describe Person, type: :model do
  let(:person) { FactoryBot.create :person }

  describe '#name' do
    context 'presence' do
      it { expect(person).to validate_presence_of(:name) }
    end

    context 'name-format' do
      # it { expect(person).to validate_format_of(:name)}
    end
  end
end
