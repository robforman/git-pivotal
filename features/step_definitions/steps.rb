STORY_TYPE = /feature|bug|chore|release/
STORY_STATE = /unscheduled|unstarted|started|finished|delivered|accepted|rejected/

Given /^I have a(?:n)? (#{STORY_STATE})?\s?Pivotal Tracker (#{STORY_TYPE})$/ do |status, type|
  update_test_story(type, status)
end

Given /^I am on the "([^"]*)" branch$/ do |branch|
  `git checkout -b #{branch} > /dev/null 2>&1`
end

Given /^I have a "([^"]*)" branch$/ do |branch|
  `git branch #{branch} > /dev/null 2>&1`
end

Then /^I should be on the "([^"]*)" branch$/ do |branch|
  current_branch.should == branch
end