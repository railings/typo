Given /^I am a logged in user$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'user2'
  fill_in 'user_password', :with => 'bbbbbbbb'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end


Given /^there is a user$/ do
  @user = User.create!({:login => 'user2',
                        :password => 'bbbbbbbb',
                        :email => 'user@example.com',
                        :profile_id =>2,
                        :name => 'user two',
                        :state => 'active'})
end
