require 'factory_girl'
require 'spec/factories/user'
require 'spec/factories/list'
require 'spec/factories/task'
require 'spec/factories/watch'

def create_user_and_their_lists
  user = Factory(:user)

  # update devise fields
  user.update_attribute(:confirmation_token, nil)
  user.update_attribute(:confirmed_at, Time.now)

  2.times { Factory(:list, :user_id => user.id) }

  user
end

Given /^I do my login$/ do
  my_user = create_user_and_their_lists
  another_user = create_user_and_their_lists

  # create a watch
  Factory(:watch, { :user_id => my_user.id, :list_id => another_user.lists[0].id })

  visit new_user_session_url 

  fill_in 'Email',    :with => my_user.email
  fill_in 'Password', :with => my_user.password

  click_button 'Sign in'
end

