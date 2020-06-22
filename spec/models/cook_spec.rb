require 'rails_helper'

RSpec.describe Cook, type: :model do
  #nameが無ければ無効な状態である
  it "is invalid without a name" do
    cook = FactoryBot.build(:cook, name: nil)
    expect(cook).to be_invalid
  end
  
  #関連づけが成功している
  it "has an association with user object" do
    cook = FactoryBot.build(:cook)
    expect(cook.user.name).to eq "Test User"
  end
  
end