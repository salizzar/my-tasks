require 'spec_helper'

describe Watch do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :list_id => 1
    }
  end

  it 'should create a new instance given valid attributes' do
    Watch.create!(@valid_attributes)
  end

  it 'should have a user' do
    watch = Watch.new @valid_attributes.except(:user_id)
    invalid_model_attribute(watch, :user_id).should be_true
  end

  it 'should have a list' do
    watch = Watch.new @valid_attributes.except(:list_id)
    invalid_model_attribute(watch, :list_id).should be_true
  end
end
