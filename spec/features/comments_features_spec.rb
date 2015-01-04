require 'rails_helper'
require_relative 'helper'

feature 'Comments' do

  context 'a user is signed in' do

    before do
      user_leaves_comment
    end

    scenario "a user can add and view a comment on a post" do
      expect(page).to have_content 'test'
    end

    scenario "a user can delete a comment on a post" do
      click_link 'X'
      expect(page).not_to have_content 'test'
      expect(page).to have_content 'Comment deleted successfully'
    end

    scenario "a user's name should be displayed in a comment" do
      visit '/'
      expect(page).to have_content 'Name'
    end
    
  end

  context 'another user creates a comment' do

    before do
      user_leaves_comment
      click_link 'Sign out'
    end

    scenario "a user cannot leave a comment if they are not signed in" do
      visit '/'
      expect(page).not_to have_link 'Comment'
    end

    scenario "a user cannot delete a comment they didn't create" do
      sign_up('mishal','m@m.com')
      expect(page).not_to have_link 'X'
    end


  end
  
end