require 'space'

describe Space do
  describe '.all' do
    it 'returns all spaces' do
      
      expect(Space.all).to include 'Private room rotherhithe'
      expect(Space.all).to include 'Entire apartment in westminster'
      expect(Space.all).to include 'Private room westminster'
    end
  end
end
