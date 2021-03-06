feature 'viewing description page' do
  scenario ' use can click on the title and go to description page' do
    sign_up
    click_button("Add Space")

    fill_in :space_name, with: "Cozy Cottage"
    fill_in :description, with: "Nice walks near by"
    fill_in :price, with: "100"
    click_button("Submit")

    visit('/spaces')
    click_on 'Cozy Cottage'

    expect(page).to have_content 'Nice walks near by'
    expect(page).to have_content '100'

  end
end
