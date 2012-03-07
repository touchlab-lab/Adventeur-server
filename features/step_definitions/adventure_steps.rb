Given /^I am a logged in user$/ do
  create_user
  sign_in
end

Given /^I go to my dashboard$/ do
  visit user_path(@user)
end

When /^I create a new Adventure$/ do
  click_on "Create a New Adventure"
end

Then /^I should be on the "([^"]*)" page$/ do |arg1|
  current_path.should == new_adventure_path
end

When /^I add a name$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I add a description$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I add five checkpoints with touts and locations$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I save the Adventure$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should be back on my dashboard$/ do
  pending # express the regexp above with the code you wish you had
end

