feature 'adding spaces' do
  scenario 'user can add a space after they signed up' do

    sign_up

    click_button("Add Space")
    expect(current_path).to eq "/spaces/new"

    fill_in :space_name, with: "Cozy Cottage"
    fill_in :description, with: "Nice walks near by"
    click_button("Submit")

    expect(page).to have_link('Cozy Cottage')
  end

  scenario 'user can not add space before signing up' do
    visit('/spaces')
    expect(page).not_to have_content("Add Space")
  end

  scenario 'user name is displayed with the space' do
    sign_up
    click_button("Add Space")
    expect(current_path).to eq "/spaces/new"

    fill_in :space_name, with: "Beach Hut"
    fill_in :description, with: "Beach walks"
    click_button("Submit")
    expect(page).to have_content "Rubber Duck"
  end
end
