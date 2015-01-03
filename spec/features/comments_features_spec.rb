require 'rails_helper'
require_relative 'helper'

feature 'Comments' do

  context 'a user is signed in' do

    before do
      sign_up('test@test.com')
      create_post('First Picture!')
      add_comment('test')
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

  
end