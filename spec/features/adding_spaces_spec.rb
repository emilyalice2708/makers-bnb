feature 'adding spaces' do
  scenario 'user can add a space' do
    visit('/spaces')
    click_button("Add Space")
    expect(current_path).to eq "/spaces/new"

    fill_in :space_name, with: "Cozy Cottage"
    click_button("Submit")

    expect(page).to have_content("Cozy Cottage")
  end
end