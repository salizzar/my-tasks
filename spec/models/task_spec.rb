require 'spec_helper'

describe Task do
  fixtures :lists

  before(:each) do
    @valid_attributes = {
      :name       => 'value for name',
      :completed  => false,
      :list       => lists(:tests)
    }
  end

  it 'should create a new instance given valid attributes' do
    Task.create!(@valid_attributes)
  end

  it 'should have a name' do
    task = Task.new @valid_attributes.except(:name)
    invalid_model_attribute(task, :name).should be_true
  end

  it 'should not accept a name with invalid characters' do
    task = Task.new @valid_attributes.merge(:name => 'U)%#$#()][')
    invalid_model_attribute(task, :name).should be_true
  end
  
  it 'should belong to a list' do
    task = Task.new @valid_attributes.except(:list)
    invalid_model_attribute(task, :list).should be_true
  end
end
