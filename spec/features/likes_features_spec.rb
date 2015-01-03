require 'rails_helper'
require_relative 'helper'

feature 'likes' do

  before do
    sign_up('test@test.com')
    create_post('hello')
  end

  scenario 'a post has no likes when created' do
    visit '/'
    expect(page).to have_content '0 Likes'
  end
  


end