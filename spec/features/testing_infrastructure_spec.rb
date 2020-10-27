feature 'testing infrastructure' do
  scenario 'hompage displayed correctly' do
    visit('/')
    expect(page).to have_content "Welcome to Makers BnB"
  end
end
