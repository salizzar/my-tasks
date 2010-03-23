require 'spec_helper'

describe List do
  before(:each) do
    @task = Task.new :name => 'a test'

    @valid_attributes = {
      :name         => 'value for name',
      :description  => 'value for description',
      :public       => false,
      :user_id      => 1,
      :tasks        => [ @task ]
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
    list = List.new @valid_attributes.except(:user_id)
    invalid_model_attribute(list, :user_id).should be_true
  end

  it 'should have at least one task' do
    list = List.new @valid_attributes.except(:tasks)
    invalid_model_attribute(list, :tasks).should be_true
  end

  it 'should associate tasks to it' do
    list = List.new @valid_attributes.except(:tasks)
    task = @task

    list.tasks << task

    list.save
    task.should_not be_new_record
  end
end
