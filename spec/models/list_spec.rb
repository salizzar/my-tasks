require 'spec_helper'

describe List do
  before(:each) do
    @task = Task.new :name => 'a test'

    @valid_attributes = {
      :name         => 'value for name',
      :description  => 'value for description',
      :public       => true,
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

  describe 'when find public lists from users' do
    it 'should exclude lists from a specific user' do
      create_public_lists(true)

      lists = List.find_public_from_others(1).select { |l| l.user_id == 1 }
      lists.size.should be_zero
    end

    it 'should have only public lists' do
      create_public_lists(false)

      lists = List.find_public_from_others(1).select { |l| l.public == false }
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

  def create_list
    List.new @valid_attributes
  end

  def create_public_lists(is_public)
      4.times do |i|
        list = create_list
        list.user_id = (i % 2) + 1
        list.public = is_public
        list.save
      end
  end

  def create_watches
    watches = []

    List.all(:conditions => { :user_id => 1 }).each do |list|
      watches << Watch.create(:user_id => 1, :list_id => list.id)
    end

    watches
  end
end
