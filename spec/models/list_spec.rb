require 'spec_helper'
require 'factories/list'
require 'factories/task'
require 'factories/user'
require 'factories/watch'

describe List do
  it 'should create a new instance given valid attributes' do
    Factory.create(:list).should be_true
  end

  it 'should have a name' do
    list = Factory.build(:list, :name => nil)
    invalid_model_attribute(list, :name).should be_true
  end

  it 'should not accept a name with invalid characters' do
    list = Factory.build(:list, :name => 'U)%#$#()][') 
    invalid_model_attribute(list, :name).should be_true
  end

  it 'should belong to a user' do
    list = Factory.build(:list, :user_id => nil)
    invalid_model_attribute(list, :user_id).should be_true
  end

  it 'should have at least one task' do
    list = Factory.build(:list, :tasks => [])
    invalid_model_attribute(list, :tasks).should be_true
  end

  it 'should associate tasks to it' do
    list = Factory.build(:list, :tasks => [])
    task = Factory.build(:task)

    list.tasks << task

    list.save
    task.should_not be_new_record
  end

  describe 'when find public lists from users' do
    it 'should exclude lists from a specific user' do
      create_public_lists(true)

      user = User.first.id

      lists = List.find_public_from_others(user.id).select { |l| l.user_id == user.id }
      lists.size.should be_zero
    end

    it 'should have only public lists' do
      create_public_lists(false)

      user = User.first.id

      lists = List.find_public_from_others(user.id).select { |l| l.public == false }
      lists.size.should be_zero
    end
  end

  describe 'when find watched' do
    it 'should match lists size' do
      create_public_lists(true)

      watches = create_watches

      lists = List.find_watched(watches)
      lists.size.should be_equal(watches.size)
    end

    it 'should have only public lists' do
      create_public_lists(false)

      watches = create_watches

      lists = List.find_watched(watches)
      lists.size.should be_zero
    end
  end

private

  def create_public_lists(is_public)
    4.times do |i|
      user = Factory.create(:user, :email => Factory.next(:email))

      2.times do |j|
        Factory.create(:list, { :public => is_public, :user => user })
      end
    end
  end

  def create_watches
    watches = []

    user = User.first.id

    List.all(:conditions => { :public => true, :user_id => user.id }).each do |list|
      watches << Factory.create(:watch, { :user => user, :list => list })
    end

    watches
  end
end
