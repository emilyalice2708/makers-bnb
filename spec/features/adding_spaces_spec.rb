feature 'adding spaces' do
  scenario 'user can add a space' do
    visit('/spaces')
    click_button ('Sign up')
    expect(current_path).to eq '/users/new'

    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('display_name', with: 'Rubber Duck')

    click_button('Submit')
    
    click_button("Add Space")
    expect(current_path).to eq "/spaces/new"

    fill_in :space_name, with: "Cozy Cottage"
    fill_in :description, with: "Nice walks near by"
    click_button("Submit")

    expect(page).to have_content("Cozy Cottage")
    expect(page).to have_content("Nice walks near by")
  end
end
