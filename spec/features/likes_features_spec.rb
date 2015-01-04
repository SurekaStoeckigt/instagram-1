require 'rails_helper'
require_relative 'helper'

feature 'likes' do

  before do
    sign_up('mishal','test@test.com')
    create_post('hello')
  end

  scenario 'a post has no likes when created' do
    visit '/'
    expect(page).to have_content '0 Likes'
  end
  
  scenario 'a user can like a post', js: true do
    visit '/'
    click_link 'Like'
    expect(page).to have_content '1 Likes'
  end

  # scenario 'a user can only like a post once', js: true do
  #   visit '/'
  #   click_link 'Like'
  #   click_link 'Like'
  #   visit '/'
  #   expect(page).to have_content '1 Likes'
  # end

end