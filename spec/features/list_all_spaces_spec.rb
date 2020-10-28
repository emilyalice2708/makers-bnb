require 'pg'
require_relative '../../lib/connection.rb'
feature 'A user can see a list of spaces' do
  scenario ' A user go to /spaces/ a can see a list of properties' do
    visit('/spaces')

    Connection.query("INSERT INTO spaces (name) VALUES ('Private room rotherhithe');")
    Connection.query("INSERT INTO spaces (name) VALUES ('Entire apartment in westminster');")
    Connection.query("INSERT INTO spaces (name) VALUES ('Private room westminster');")


    expect(page).to have_content 'Private room rotherhithe'
    expect(page).to have_content 'Entire apartment in westminster'
    expect(page).to have_content 'Private room westminster'

  end
end
