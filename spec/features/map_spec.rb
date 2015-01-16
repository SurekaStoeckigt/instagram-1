require 'rails_helper'
require_relative 'helper'

feature 'Maps:' do
  
  before do
    sign_up('Mishal','test@test.com')
    create_post('First')
  end

  scenario "Each user has a map in their profile" do
    visit '/'
    click_link 'Mishal'
    expect(page).to have_link 'Map'
    click_link 'Map'
    expect(page).to have_content "Mishal's Map"
  end

end