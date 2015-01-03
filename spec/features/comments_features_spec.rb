require 'rails_helper'
require_relative 'helper'

feature 'Comments' do

  def user_leaves_comment
    sign_up('test@test.com')
    create_post('First Picture!')
    add_comment('test')
  end

  context 'a user is signed in' do

    before do
      user_leaves_comment
    end

    scenario "a user can leave a comment on a post" do
      expect(page).to have_content 'test'
    end

    scenario "a user can leave a comment on a post" do
      click_link 'X'
      expect(page).not_to have_content 'test'
      expect(page).to have_content 'Comment deleted successfully'
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

  end
  
end