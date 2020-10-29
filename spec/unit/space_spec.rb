require 'space'
require 'pg'
describe Space do
  describe '.all' do
    it 'returns all spaces' do
      user = User.create(email: 'test@example.com',
        password: 'password12345',
        display_name: 'Rubber Duck')
      new_space = Space.create(name: 'Private room rotherhithe', description: 'Close to tube station', user_id: user.id)
      Space.create(name:'Entire apartment in westminster', description: 'A view to Big Ben', user_id: user.id)
      Space.create(name: 'Private room westminster', description: 'High ceiling', user_id: user.id)
      
      all_spaces = Space.all
      expect(all_spaces).to be_a Array
      expect(all_spaces.length).to eq 3
      expect(all_spaces.first).to be_a Space 
      expect(all_spaces.first.id).to eq new_space.id
      expect(all_spaces.first.name).to eq "Private room rotherhithe"
    end
  end

  describe '.create' do
    it 'creates a new space' do 
      user = User.create(email: 'test@example.com',
        password: 'password12345',
        display_name: 'Rubber Duck')
      space = Space.create(name: "Cozy Cottage", description: "Nice walks around", user_id: user.id)
      expect(space).to be_a Space
      expect(space.description).to eq("Nice walks around")
      expect(space.user_id).to eq(user.id)
    end
  end 

  describe '#user_name' do
    it 'returns the user_name belonging to the space' do
      user = User.create(email: 'test@example.com',
        password: 'password12345',
        display_name: 'Rubber Duck')
      space = Space.create(name: "Cozy Cottage", description: "Nice walks around", user_id: user.id)
      expect(space.user_name).to eq "Rubber Duck"
    end
  end
end
