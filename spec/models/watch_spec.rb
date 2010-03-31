require 'spec_helper'

describe Watch do
  before(:each) do
    list = create_list(true)

    @valid_attributes = {
      :user_id => 1,
      :list_id => list.id
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

  it 'should not accept a private list' do
    list = create_list(false)

    watch = Watch.new @valid_attributes.merge(:list_id => list.id)
    invalid_model_attribute(watch, :list_id).should be_true
  end

  describe 'when toggle' do
    it 'should create if not exists' do
      watch = Watch.toggle(@valid_attributes[:user_id], @valid_attributes[:list_id])
      watch.should_not be_nil
    end

    it 'should destroy if already exists' do
      Watch.create :user_id => @valid_attributes[:user_id], :list_id => @valid_attributes[:list_id]
      watch = Watch.toggle(@valid_attributes[:user_id], @valid_attributes[:list_id])
      watch.should be_nil
    end
  end

private

  def create_list(is_public)
	List.create :name         => 'A name',
                :description  => 'A description',
                :public       => is_public,
                :user_id      => 1,
                :tasks        => [ Task.create :name => 'A task' ] 
  end
end

