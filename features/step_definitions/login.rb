def create_tasks(list)
  3.times do |i|
    list.tasks << Task.new(:name => 'A task')
  end

  list.save
end

def create_lists(user)
  3.times do |i|
    list = List.create(:name => 'A name', :description => 'A description', :public => true)

    create_tasks(list)

    user.lists << list
  end
end

def create_user(params)
  user = User.create(params)

  user.update_attribute(:confirmation_token, nil)
  user.update_attribute(:confirmed_at, Time.now)

  user
end

Given /^I do my login$/ do
  user = create_user(:email => 'salizzar@gmail.com', :password => 'plataforma', :password_confirmation => 'plataforma')
  create_lists(user)

  # create another user to generate public lists
  user2 = create_user(:email => 'marcelo@XY7.com.br', :password => 'plataforma', :password_confirmation => 'plataforma')
  create_lists(user2)

  # create a watch to test unwatch
  Watch.create :user_id => user.id, :list_id => user2.lists[0].id

  visit new_user_session_url 

  fill_in 'Email',    :with => user.email
  fill_in 'Password', :with => user.password

  click_button 'Sign in'
end

