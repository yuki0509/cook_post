require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) } 
  
  #名前、メール、パスワードがあれば有効な状態
  it "is valid with name, email, password, password_confirmation" do
    expect(user).to be_valid  
  end
  
  #名前がないなら無効
  it "is invalid without name" do
    user.name = nil
    user.valid?
    expect(user.errors[:name]).to include(I18n.t('errors.messages.blank'))
  end

  #メールアドレスがないと無効
  it "is invalid without email" do
    user.email = nil
    user.valid?
    expect(user.errors.messages[:email]).to include(I18n.t('errors.messages.blank'))  
  end
  
  #パスワードがないと無効
  it "is invalid without password" do
    user.password = nil
    user.valid?
    expect(user.errors[:password]).to include(I18n.t('errors.messages.blank'))
  end
  
  #二つのパスワードが重複していないと無効
  it "is invalid with a duplicate passwords" do
    user.password = "pass"
    user.valid?
    expect(user.errors.messages[:password_confirmation]).to include("とパスワードの入力が一致しません")
  end
  
  let!(:user1) {FactoryBot.create(:user, email: "hoge@test.com")}
  let!(:user2) {FactoryBot.build(:user, email: "hoge@test.com")}
  # 重複したメールアドレスは無効
  it "is invalid with a duplicate email" do
    user2.valid?
    expect(user2.errors[:email]).to include(I18n.t('errors.messages.taken'))  
  end
  
end
