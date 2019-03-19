require 'rails_helper'

describe User, type: :model do
  let(:user) { FactoryBot.create(:admin_user) }

  describe '#name' do
    context 'presence' do
      it { expect(user).to validate_presence_of(:name) }
    end
  end

  describe '#email' do
    context 'presence' do
      it { expect(user).to validate_presence_of(:email) }
    end

    context 'format' do
      # it { expect(user).to validate_format_of(:email)}
    end

    context 'email unique' do
      it { expect(user).to validate_uniqueness_of(:email) }
    end
  end

  describe '#password' do
    context 'nil' do
       it { expect(user).to be_valid}
    end
  end
end
