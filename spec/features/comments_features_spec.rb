require 'rails_helper'
require_relative 'helper'

feature 'comments' do

  before do
    sign_up('test@test.com')
    create_post('First Picture!')
  end

  scenario "a user can leave a comment on a post" do
    click_link 'Comment'
    fill_in 'Thoughts', with: 'test'
    click_button 'Send'
    expect(page).to have_content('test')
  end
  
end