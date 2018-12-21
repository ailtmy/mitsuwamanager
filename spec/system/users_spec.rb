require 'rails_helper'

describe 'ユーザー管理機能', type: :system do
  describe '一覧表示機能' do
    let(:user_a) { FactoryBot.create(:admin_user, name: 'ユーザーＡ', email: 'a@example.com', admin: true) }
    let(:user_b) { FactoryBot.create(:admin_user, name: 'ユーザーＢ', email: 'b@example.com') }

    before do
      visit login_path	      
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'ログインする'
    end

    context '管理ユーザーAがログインしているとき' do
      let(:login_user) { user_a }

      it 'ユーザー一覧が表示される' do
        #　ユーザー一覧が表示されていることを確認
        expect(page).to have_content 'ユーザー一覧'
      end
    end

    context 'ユーザーBがログインしているとき' do
      let(:login_user) { user_b }

      it 'ユーザー一覧が表示されない' do
        #　ユーザー一覧が表示されないことを確認
        expect(page).to have_content 'ログイン'
      end
    end
  end
end