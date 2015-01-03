require 'rails_helper'
require_relative './helper'

feature 'users' do

  context 'when a user is not logged in' do
  
    scenario 'they should be able to see sign in and sign up links' do
      visit '/'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    scenario 'they should not see a sign out link' do
      visit '/'
      expect(page).not_to have_link 'Sign out'
    end

    scenario 'they should be able to sign up' do
      sign_up('test@test.com')
      expect(page).to have_content 'Welcome! You have signed up successfully'
    end

  end

  context 'a user is logged in' do
    before do
      sign_up('test@test.com')
    end

    scenario 'they should see a sign out link' do
      visit '/'
      expect(page).to have_link 'Sign out'
    end

    scenario 'they should not see a sign in or sign out link' do
      visit '/'
      expect(page).not_to have_link 'Sign in'
      expect(page).not_to have_link 'Sign up'
    end

  end

end