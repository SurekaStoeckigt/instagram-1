def sign_up(email)
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: 'testtest'
  fill_in 'Password confirmation', with: 'testtest'
  click_button 'Sign up'
end

  def create_post(title)
    visit '/'
    click_link 'Add Photo'
    fill_in 'Title', with: title
    attach_file "Image", File.join(Rails.root, '/spec/features/burger.png')
    click_button "Create Post"
  end