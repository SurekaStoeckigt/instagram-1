def sign_up(name, email)
  visit '/'
  click_link 'Sign up'
  fill_in 'First name', with: name
  fill_in 'Last name', with: 'Islam'
  fill_in 'Profile name', with:'Mishal_Islam'
  fill_in 'Email', with: email
  fill_in 'Password', with: 'testtest'
  fill_in 'Password confirmation', with: 'testtest'
  click_button 'Sign up'
end

def create_post(title)
  visit '/'
  click_link 'Add Photo'
  fill_in 'Name', with:'Mishal Islam'
  fill_in 'Title', with: title
  attach_file "Image", File.join(Rails.root, '/spec/features/burger.png')
  click_button "Create Post"
end

def add_comment(thoughts)
  click_link 'Comment'
  fill_in 'Thoughts', with: thoughts
  fill_in 'Name', with: 'Name'
  click_button 'Send'
end

def user_leaves_comment
  sign_up('mishal','test@test.com')
  create_post('First Picture!')
  add_comment('test')
end