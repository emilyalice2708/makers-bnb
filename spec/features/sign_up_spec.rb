feature ' sign up' do
  scenario ' a user can sign up' do
    visit('/spaces')
    click_button ('Sign up')
    expect(current_path).to eq '/users/new'

    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('display_name', with: 'Rubber Duck')

    click_button('Submit')
    expect(current_path).to eq '/spaces'
    expect(page).to have_content "Welcome, Rubber Duck"
  end
end
