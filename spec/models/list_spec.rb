require 'spec_helper'

describe List do
  fixtures :users, :lists

  before(:each) do
    @valid_attributes = {
      :name         => 'value for name',
      :description  => 'value for description',
      :public       => false,
      :user         => users(:marcelo),
      :tasks        => lists(:tests).tasks
    }
  end

  it 'should create a new instance given valid attributes' do
    List.create!(@valid_attributes)
  end

  it 'should have a name' do
    list = List.new @valid_attributes.except(:name)
    invalid_model_attribute(list, :name).should be_true
  end

  it 'should not accept a name with invalid characters' do
    list = List.new @valid_attributes.merge(:name => 'U)%#$#()][')
    invalid_model_attribute(list, :name).should be_true
  end

  it 'should belong to a user' do
    list = List.new @valid_attributes.except(:user)
    invalid_model_attribute(list, :user).should be_true
  end

  it 'should have a task' do
    list = List.new @valid_attributes.except(:tasks)
    invalid_model_attribute(list, :tasks).should be_true
  end
end
