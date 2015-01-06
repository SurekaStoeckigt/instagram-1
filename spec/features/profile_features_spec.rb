require 'rails_helper'
require_relative 'helper'

feature 'profile' do

  before do
    sign_up('Mishal','test@test.com')
    create_post('First')
  end

scenario "a user can visit a profile by clicking a user's name in a post" do
  visit '/'
  click_link 'Mishal'
  expect(page).to have_content '1 Posts'
  expect(page).to have_content 'Mishal'
end

scenario "a user can visit a profile by clicking a user's name in a comment" do
  visit '/'
  click_link 'Sign out'
  sign_up('mishal','m@m.com')
  add_comment('test')
  click_link 'mishal'
  expect(page).to have_content '0 Posts'
  expect(page).to have_content 'mishal'  
end

  # scenario 'a user should be able to click on an image and see the post' do

  # end

end