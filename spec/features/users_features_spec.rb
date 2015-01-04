require 'rails_helper'
require_relative 'helper'

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
      sign_up('mishal','test@test.com')
      expect(page).to have_content 'Welcome! You have signed up successfully'
    end

    scenario 'a user cannot add a photo if they are not logged in' do
      visit '/posts/new'
      expect 'You need to sign in or sign up before continuing'
      expect(page).not_to have_link 'Add Photo'
    end

  end

  context 'a user is logged in' do

    before do
      sign_up('mishal','test@test.com')
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

  context 'setting limits on users' do

    before do
      sign_up('mishal','test@test.com')
      @post = Post.create(title:'Hello', user_id:2)
      click_link 'Sign out'
      sign_up('mishal','m@m.com')
    end

    scenario "a user cannot edit a post they haven't created" do
      expect(page).not_to have_link 'Edit'
      visit "/posts/#{@post.id}/edit"
      expect(current_path).to eq "/"
    end

    scenario "a user cannot delete a post they didn't create" do
      expect(page).not_to have_link 'Delete'
    end

  end

end