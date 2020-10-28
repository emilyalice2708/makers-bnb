feature ' sign up' do
  scenario ' a user can sign up' do
    visit('/')
    click_button ('Sign up')

    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('display_name', with: 'Rubber Duck')

    click_button('Submit')

    expect(page).to have_content "Welcome, Rubber Duck"
  end
end
