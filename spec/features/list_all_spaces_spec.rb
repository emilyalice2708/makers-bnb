feature 'A user can see a list of spaces' do
  scenario ' A user go to /spaces/ a can see a list of properties' do
    visit('/spaces')

<<<<<<< HEAD
=======
    expect(page).to have_content 'Private room rotherhithe'
    expect(page).to have_content 'Entire apartment in westmister'
>>>>>>> 47a121b7e6c68962a0292b05e550ffcaf1907e7b
    expect(page).to have_content 'Private room rotherhithe'
    expect(page).to have_content 'Entire apartment in westmister'
    expect(page).to have_content 'Private room rotherhithe'
  end
end
