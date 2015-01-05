require 'rails_helper'
require_relative 'helper'

feature 'profile' do

  before do
    sign_up('mishal','test@test.com')
    create_post('First')
  end

  scenario 'a user can visit a profile' do
    visit '/'
    click_link 'Mishal Islam'
    expect(page).to have_content '1 Posts'
    expect(page).to have_content 'test@test.com'
  end

end