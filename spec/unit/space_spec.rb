require 'space'
require 'pg'
describe Space do
  describe '.all' do
    it 'returns all spaces' do
      new_space = Space.create(name: 'Private room rotherhithe')
      Space.create(name:'Entire apartment in westminster')
      Space.create(name: 'Private room westminster')
      
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
      space = Space.create(name: "Cozy Cottage")
      expect(space).to be_a Space   
    end
  end 
end
