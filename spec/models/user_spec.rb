require 'rails_helper'

RSpec.describe User, type: :model do
  #名前、メール、パスワードがあれば有効な状態
  it "is valid with name, email, password, password_confirmation" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid  
  end
  
  #名前がないなら無効
  it "is invalid without name" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include(I18n.t('errors.messages.blank'))
  end

  #メールアドレスがないと無効
  it "is invalid without email" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors.messages[:email]).to include(I18n.t('errors.messages.blank'))  
  end
  
  #パスワードがないと無効
  it "is invalid without password" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include(I18n.t('errors.messages.blank'))
  end
  
  #二つのパスワードが重複していないと無効
  it "is invalid with a duplicate passwords" do
    user = FactoryBot.build(:user, password: "pass")
    user.valid?
    # p user.errors.messages.confirmation
    expect(user.errors.messages[:password_confirmation]).to include(I18n.t('errors.messages.confirmation',attribute: "password_confirmation" ))
  end
  
  # 重複したメールアドレスは無効
  it "is incalid with a suplicate email" do
    user1 = FactoryBot.create(:user, email: "hoge@test.com")
    user2 = FactoryBot.build(:user, email: "hoge@test.com")
    user2.valid?
    expect(user2.errors[:email]).to include(I18n.t('errors.messages.taken'))  
  end
  
end
