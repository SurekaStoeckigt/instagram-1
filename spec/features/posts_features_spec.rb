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

  end

  context 'posts existing' do

    before do
      create_post('First Picture!')
    end



  end
  
end