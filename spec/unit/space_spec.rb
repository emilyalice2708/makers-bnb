require 'space'
require 'pg'
describe Space do
  describe '.all' do
    it 'returns all spaces' do
      new_space = Space.create(name: 'Private room rotherhithe', description: 'Close to tube station')
      Space.create(name:'Entire apartment in westminster', description: 'A view to Big Ben')
      Space.create(name: 'Private room westminster', description: 'High ceiling')
      
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
      space = Space.create(name: "Cozy Cottage", description: "Nice walks around")
      expect(space).to be_a Space
      expect(space.description).to eq("Nice walks around")
    end
  end 
end
