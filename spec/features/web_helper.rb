def sign_up
  visit('/spaces')
  click_button ('Sign up')
  expect(current_path).to eq '/users/new'

  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'password123')
  fill_in('display_name', with: 'Rubber Duck')

  click_button('Submit')
end