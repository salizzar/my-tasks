Given /^visit the link 'My Tasks Lists'$/ do
  click_link 'My Tasks Lists'
# pending # express the regexp above with the code you wish you had
end

Given /^visit the link 'New list'$/ do
  click_link 'New list'
end

When /^I click on the link 'Add a task'$/ do
  click_link 'Add a task'
end

Then /^I should see the task fields$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I click on the link 'Remove'$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should hidden the task$/ do
  pending # express the regexp above with the code you wish you had
end
