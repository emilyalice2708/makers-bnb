require 'user'
describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'test@example.com',
                          password: 'password12345',
                          display_name: 'Rubber Duck')

      expect(user.email).to eq 'test@example.com'
      expect(user.password).to eq 'password12345'
      expect(user.display_name).to eq 'Rubber Duck'
    end
  end
end
