feature 'A user can see a list of spaces' do
  scenario ' A user go to /spaces/ a can see a list of properties' do
    visit('/spaces')

    expect(page).to have_content 'Private room rotherhithe'
    expect(page).to have_content 'Entire apartment in westminster'
    expect(page).to have_content 'Private room westminster'

  end
end
