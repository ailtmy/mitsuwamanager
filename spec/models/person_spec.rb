require 'rails_helper'

describe Person, type: :model do
  let(:person) { FactoryBot.create :person }
  let(:inperson) { Person.create(
    name: 'テスト　太郎', 
    kana: 'テスト タロウ', 
    birthday: "2020-12-31"
    )}

  describe '#name' do
    context 'presence' do
      it { expect(person).to validate_presence_of(:name) }
    end

    context 'valid' do
       it { expect(person).to be_valid }
       it { expect(inperson).to be_invalid }
    end
  end
end
