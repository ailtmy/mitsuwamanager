require 'rails_helper'

describe User, type: :model do

  it '名前は必須' do
    user = build(:admin_user, name: '')
    user.valid?
    expect(user.errors[:name]).to include('を入力してください')
  end
end