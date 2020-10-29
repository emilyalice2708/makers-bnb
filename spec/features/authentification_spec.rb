feature 'authentification' do
  scenario 'a user can sign in' do
    sign_up
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Submit')

    expect(page).to have_content 'Welcome, Rubber Duck'
  end

  scenario 'a user can sign out' do
    sign_up


    visit '/sessions/new'

    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')

    click_button('Submit')
    expect(page).to have_content 'Welcome, Rubber Duck'
    click_button('Sign out')

    expect(page).not_to have_content 'Welcome, Rubber Duck'
  end

end
