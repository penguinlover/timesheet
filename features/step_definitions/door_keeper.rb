When /I am on the home page/ do
  visit root_path
end

When /I am trying to visit (.+)$/ do |path|
  visit send(path)
end

Then /I should be redirected to login page/ do
  page.should have_content('Log in via')
end

Then /I should see login form/ do
  page.should have_content('Log in via')
end
