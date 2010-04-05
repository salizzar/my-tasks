Given /^visit 'My Public Lists'$/ do
  click_link 'View Public Lists'
end

When /^I click on the link Watch$/ do
  link = all("//table/tr/td/a[text()='Watch']").last[:href]

  visit link
end

Then /^I should see 'List was successfully watched\.'$/ do
  page.should have_content 'List was successfully watched.'
end

When /^I click on the link Unwatch$/ do
  link = all("//table/tr/td/a[text()='Unwatch']").last[:href]

  visit link
end

Then /^I should see 'List was successfully unwatched\.'$/ do
  page.should have_content 'List was successfully unwatched.'
end

