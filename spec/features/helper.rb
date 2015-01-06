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
  fill_in 'Title', with: title
  attach_file "Image", File.join(Rails.root, '/spec/features/burger.png')
  click_button "Create Post"
end

def add_comment(thoughts)
  click_link 'Comment'
  fill_in 'Thoughts', with: thoughts
  click_button 'Send'
end

def different_user_leaves_comment
  sign_up('Mishal','test@test.com')
  create_post('First Picture!')
  click_link 'Sign out'
  sign_up('MISHAL', '1@1.com')
  add_comment('HELLO')
end