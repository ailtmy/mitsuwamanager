require 'rails_helper'

describe 'アカウント情報の編集機能', type: :system do
  describe 'マイアカウント表示機能' do
    let(:user_a) { FactoryBot.create(:admin_user, name: 'ユーザーＡ', email: 'a@example.com', admin: true) }
    let(:user_b) { FactoryBot.create(:admin_user, name: 'ユーザーＢ', email: 'b@example.com') }

    before do
      visit login_path
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'ログインする'
    end

    shared_examples_for 'マイアカウントが表示される' do
      it { expect(page).to have_content 'マイアカウント' }
    end
  
    context '管理ユーザーAがログインしているとき' do
      let(:login_user) { user_a }

      before do
        visit account_path
      end
      
      it_behaves_like 'マイアカウントが表示される'
      
      describe 'アカウント情報の編集' do
        before do	
          click_link 'アカウント情報の編集'
        end

        context '編集' do
          before do
            fill_in '名前', with: 'ユーザーＡ１'
            fill_in 'メールアドレス', with: 'a1@example.com'
            fill_in '現在のパスワード', with: login_user.password
            fill_in '新しいパスワード', with: 'newpassword'
            fill_in '新しいパスワード（確認）', with: 'newpassword'
            click_button '変更する'
          end
          
          it_behaves_like 'マイアカウントが表示される'
        end
      end
    end

    context 'ユーザーBがログインしているとき' do
      let(:login_user) { user_b }

      before do
        visit account_path
      end

      it_behaves_like 'マイアカウントが表示される'
    end
  end
end