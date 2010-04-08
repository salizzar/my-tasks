require 'spec_helper'
require 'factories/user'
require 'factories/list'
require 'factories/task'
require 'factories/watch'

describe User do
  describe 'when confirm a watch' do
    it 'should be true if a list is present in watched lists' do
      user = Factory.create(:user, :email => Factory.next(:email))
      list = Factory.create(:list, :user_id => user.id)

      user.watches << Factory.create(:watch, :user_id => user.id, :list_id => list.id)

      user.is_watching?(list).should eql true
    end

    it 'should be false if a list is not present in watched lists' do
      user = Factory.create(:user, :email => Factory.next(:email))
      list = Factory.create(:list)

      user.is_watching?(list).should eql false
    end
  end
end
