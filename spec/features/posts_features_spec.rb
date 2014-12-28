require 'rails_helper'

feature 'posts' do

  context 'no posts added' do
    scenario 'should display there are no posts' do
      visit '/posts'
      expect(page).to have_content 'No Recent Photos'
    end
  end
  
end