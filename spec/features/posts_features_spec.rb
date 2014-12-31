require 'rails_helper'

feature 'posts' do

  def create_post(title)
    visit '/posts'
    click_link 'Add Photo'
    fill_in 'Title', with: title
    attach_file "Image", File.join(Rails.root, '/spec/features/burger.png')
    click_button "Create Post"
  end

  context 'no posts added' do

    scenario 'should display there are no posts' do
      visit '/posts'
      expect(page).to have_content 'No Recent Photos'
    end

    scenario 'a user can add a photo with a title' do
      create_post('First Picture!')
      expect(page).to have_content "First Picture!"
    end

    scenario 'a user can view a post' do
      @post = Post.create(title:'Hello')
      visit '/posts'
      click_button 'image_button'
      expect(page).to have_content 'Hello'
      # expect(current_path).to eq "/posts/#{@post.id}"
      # FIX! working in localhost...
    end

  end

  context 'posts existing' do

    before do
      create_post('First Picture!')
    end

    scenario 'a user can edit the title of a post' do
      visit '/posts'
      click_link 'Edit'
      fill_in 'Title', with:'Second attempt'
      click_button 'Update Post'
      expect(page).not_to have_content 'First Picture!'
      expect(page).to have_content 'Second attempt'
    end

    scenario 'a user can delete a post' do
      visit '/posts'
      click_link 'Delete'
      expect(page).not_to have_content 'First Picture!'
      expect(page).to have_content 'Post deleted!'
    end

  end
  
end