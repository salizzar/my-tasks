require 'spec_helper'
require 'factories/user'
require 'factories/list'
require 'factories/task'

describe ListsHelper do
  before(:each) do
    @form_builder = ActionView::Helpers::FormBuilder.new(:tasks, Task.new, helper, {}, {})
  end

  it 'is included in the helper object' do
    included_modules = (class << helper; self; end).send :included_modules
    included_modules.should include(ListsHelper)
  end

  describe 'when create a watch link' do
    it 'should have a valid url' do
      user = create_user
      list = create_list

      helper.watch_link(user, list).should have_tag('a[href=?]', "/users/lists/toggle_watch/#{list.id}")
    end

    it 'should be "Watch" if list is not watched' do
      user = create_user
      list = create_list

      helper.watch_link(user, list).should have_tag('a', :text => 'Watch')
    end

    it 'should be "Unwatch" if list is already watched' do
      user = create_user
      list = create_list

      user.watches << Watch.new(:user_id => 1, :list_id => list.id)

      helper.watch_link(user, list).should have_tag('a', :text => 'Unwatch')
    end
  end

private

  def create_list
    Factory(:list)
  end

  def create_user
    Factory(:user)
  end
end
