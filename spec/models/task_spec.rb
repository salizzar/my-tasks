require 'spec_helper'
require 'factories/task'

describe Task do
  it 'should create a new instance given valid attributes' do
    Factory.create(:task).should be_true
  end

  it 'should have a name' do
    task = Factory.build(:task, :name => nil)
    invalid_model_attribute(task, :name).should be_true
  end

  it 'should not accept a name with invalid characters' do
    task = Factory.build(:task, :name => 'U)%#$#()][') 
    invalid_model_attribute(task, :name).should be_true
  end
end
