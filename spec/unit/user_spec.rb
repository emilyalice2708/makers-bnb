require 'user'
describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'test@example.com',
                          password: 'password12345',
                          display_name: 'Rubber Duck')

      expect(user.email).to eq 'test@example.com'
      expect(user.password).to eq user.password
      expect(user.display_name).to eq 'Rubber Duck'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('rosebud')
      User.create(email: 'test@example.com',
                  password: 'rosebud',
                  display_name: 'tester')
    end
  end

  describe '.find' do
    it 'returns a user' do
      user = User.create(email: 'hello@email.com',
                          password: 'password123',
                          display_name: 'hey')
      found_user = User.find(id: user.id)
      expect(found_user.id).to eq user.id
      expect(found_user.display_name).to eq user.display_name
      expect(found_user.password).to eq user.password
      expect(found_user.email).to eq user.email
    end
  end
  describe '.authenticate' do
    it ' returns a user given a correct username and password, if one exist' do
      user = User.create(email: 'hello@email.com',
                          password: 'password123',
                          display_name: 'hey')
      authenticated_user = User.authenticate(email: 'hello@email.com', password: 'password123')

      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect email' do
      user = User.create(email: 'hello@email.com',
        password: 'password123',
        display_name: 'hey')
      expect(User.authenticate(email: 'hi@email.com', password: 'password123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      user = User.create(email: 'hello@email.com',
        password: 'password123',
        display_name: 'hey')
      expect(User.authenticate(email: 'hello@email.com', password: 'password456')).to be_nil
    end
  end
end
