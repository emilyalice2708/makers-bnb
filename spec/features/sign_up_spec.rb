feature ' sign up' do
  scenario ' a user can sign up' do
    
    sign_up

    expect(current_path).to eq '/spaces'
    expect(page).to have_content "Welcome, Rubber Duck"
  end
end
