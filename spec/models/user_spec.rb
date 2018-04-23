require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = create(:user)
  end

  it 'should be valid with a valid name' do
    expect(@user).to be_valid
  end

  it 'should be invalid with a blank name' do
    @user.name=""
    expect(@user).to be_invalid
  end
end
