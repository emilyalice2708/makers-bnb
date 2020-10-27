feature 'A user can see a list of spaces' do
  scenario ' A user go to /properties/ a can see a list of properties' do
    visit('/properties')

    expect(page).to have_content 'Private room rotherhithe'
    expect(page).to have_content 'Entire apartment in westmister'
    expect(page).to have_content 'Private room westminster'
  end
end
