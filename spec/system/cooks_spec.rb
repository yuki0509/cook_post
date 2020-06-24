require 'rails_helper'

RSpec.describe '料理記事の投稿機能', type: :system do
    describe '一覧表示機能' do
        let(:user_a) { FactoryBot.create(:user,name: "ユーザーA")}
        let(:user_b) { FactoryBot.create(:user,name: "ユーザーB") } 
        let(:cook_a) { FactoryBot.create(:cook,name: '最初の料理A',user: user_a)}
        let(:cook_b) { FactoryBot.create(:cook,name: '最初の料理B',user: user_b)} 

        context 'ユーザーAがログインしているとき' do
            before  do 
                visit login_path
                cook_a
                fill_in 'メールアドレス', with: user_a.email
                fill_in 'パスワード', with: user_a.password
                click_button 'ログイン'
            end

            it 'ユーザーAが投稿した記事が表示される' do
                expect(page).to have_content '最初の料理A'
            end
        end
        
        context "ユーザーBがログインしている時" do
            before do
                visit login_path
                cook_b
                fill_in 'メールアドレス', with:user_b.email 
                fill_in 'パスワード', with: user_b.password
                click_button 'ログイン'
            end
            
            it "ユーザーBが投稿した記事が表示される" do
                expect(page).to have_content '最初の料理B'
            end

            it "ユーザーAが書いた記事は表示されない" do
                cook_a
                expect(page).to_not have_content '最初の料理A' 
            end
            
        end
    end
end