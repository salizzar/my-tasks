require 'spec_helper'

describe User do
  before(:each) do
    @list = List.create :name        => 'A name',
                        :description => 'A description',
                        :public      => true,
                        :user_id     => 1,
                        :tasks       => [ Task.new :name => 'A task' ]

    @valid_attributes = {
      :email         => 'salizzar@gmail.com',
      :password      => 'plataforma',
      :password_salt => 'plataforma'
    }
  end

  describe 'when confirm a watch' do
    it 'should be true if a list is present in watched lists' do
      user = create_user

      user.watches << Watch.create(:user_id => user.id, :list_id => @list.id)

      user.is_watching?(@list).should eql true 
    end

    it 'should be false if a list is not present in watched lists' do
      user = create_user

      user.is_watching?(@list).should eql false
    end
  end

private

  def create_user
    User.create @valid_attributes
  end
end
