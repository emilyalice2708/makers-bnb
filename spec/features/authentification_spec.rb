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

  scenario 'a user sees an error if their email is incorrect' do
    sign_up
    visit '/sessions/new'
    fill_in(:email, with: 'tt@example.com')
    fill_in(:password, with: 'password123')

    click_button('Submit')
    expect(page).not_to have_content 'Welcome, Rubber Duck'
    expect(page).to have_content 'Check your email or password'
  end

  scenario 'a user sees an error if their password is incorrect' do
    sign_up
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password456')

    click_button('Submit')
    expect(page).not_to have_content 'Welcome, Rubber Duck'
    expect(page).to have_content 'Check your email or password'
  end

end
