require 'rails_helper'

RSpec.describe Cook, type: :model do
  let(:cook) { FactoryBot.build(:cook)} 

  #nameが無ければ無効な状態である
  it "is invalid without a name" do
    cook.name = nil
    expect(cook).to be_invalid
  end
  
  #関連づけが成功している
  it "has an association with user object" do
    expect(cook.user.name).to eq "Test User"
  end
  
end