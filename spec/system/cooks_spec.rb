require 'rails_helper'

describe '料理記事の投稿機能', type: :system do
    describe '一覧表示機能' do
        before do
            user_a = FactoryBot.create(:user, name: "ユーザーA", email: "a@example.com")
            FactoryBot.create(:cook, name: '最初の料理', user: user_a)
        end

        context 'ユーザーAがログインしているとき' do
            before  do 
                visit login_path
                fill_in 'メールアドレス', with: 'a@example.com'
                fill_in 'パスワード', with: "password"
                click_button 'ログイン'
            end

            it 'ユーザーAが投稿した記事が表示される' do
                expect(page).to have_content '最初の料理'
            end
        end
        
    end
    
end
