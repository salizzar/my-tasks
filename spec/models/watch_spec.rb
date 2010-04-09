require 'spec_helper'
require 'factories/user'
require 'factories/list'
require 'factories/task'
require 'factories/watch'

describe Watch do
  it 'should create a new instance given valid attributes' do
    user = Factory(:user) 

    Factory(:watch, :user_id => user.id).should be_true
  end

  it 'should have a user' do
    watch = Factory.build(:watch, :user_id => nil)
    invalid_model_attribute(watch, :user_id).should be_true
  end

  it 'should have a list' do
    watch = Factory.build(:watch, :list_id => nil)
    invalid_model_attribute(watch, :list_id).should be_true
  end

  it 'should not accept a private list' do
    list = Factory(:list, :public => false)

    watch = Factory.build(:watch, { :user_id => list.user_id, :list_id => list.id })
    invalid_model_attribute(watch, :list_id).should be_true
  end

  describe 'when toggle' do
    it 'should create if not exists' do
      user = Factory(:user)
      list = Factory(:list, :user_id => user.id)

      watch = Watch.toggle(user.id, list.id)
      watch.should_not be_nil
    end

    it 'should destroy if already exists' do
      user = Factory(:user)
      list = Factory(:list, :user_id => user.id)

      Factory(:watch, :user_id => user.id, :list_id => list.id)

      deleted_watch = Watch.toggle(user.id, list.id)
      deleted_watch.should be_nil
    end
  end
end

