require 'rails_helper'
require_relative 'helper'

feature 'posts' do

  context 'no posts added' do

    before do
      sign_up('test@test.com')
    end

    scenario 'should display there are no posts' do
      visit '/'
      expect(page).to have_content 'No Recent Photos'
    end

    scenario 'a user can add a photo with a title' do
      create_post('First Picture!')
      expect(page).to have_content "First Picture!"
    end

    scenario 'a user can view a post' do
      @post = Post.create(title:'Hello')
      visit '/'
      find('.thumbnail_image').click
      expect(page).to have_content 'Hello'
      # expect(current_path).to eq "/posts/#{@post.id}"
      # FIX! working in localhost...
    end

  end

  context 'posts existing' do

    before do
      sign_up('test@test.com')
      create_post('First Picture!')
    end

    scenario 'a user can edit the title of a post' do
      visit '/'
      click_link 'Edit'
      fill_in 'Title', with:'Second attempt'
      click_button 'Update Post'
      expect(page).not_to have_content 'First Picture!'
      expect(page).to have_content 'Second attempt'
    end

    scenario 'a user can delete a post' do
      visit '/'
      click_link 'Delete'
      expect(page).not_to have_content 'First Picture!'
      expect(page).to have_content 'Post deleted!'
    end

  end
  
end