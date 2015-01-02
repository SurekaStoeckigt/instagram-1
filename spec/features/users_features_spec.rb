require 'rails_helper'
require 'helper'

feature 'users' do

  context 'when a user is not logged in' do
  
    scenario 'they should be able to sign in' do
      visit '/posts'
      expect(page).to have_link 'Sign in'
    end

    scenario 'they should see a sign up button' do
      visit '/posts'
      expect(page).to have_link 'Sign up'
    end

    scenario 'they should not see a sign out button' do
      visit '/posts'
      expect(page).not_to have_link 'Sign out'
    end

    scenario 'they should be able to sign in' do
      sign_up('test@test.com')
      expect(page).to have_link ''
    end

  end

  context 'a user is logged in' do

  end

end