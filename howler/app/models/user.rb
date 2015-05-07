class User
  include Mongoid::Document
  include Mongoid::Sadstory
  include Mongoid::Timestamps
  embeds_many :growls

  field :name, type: String
  field :lastname, type: String
  field :password, type: String
  field :salt, type: String
  field :username, type: String
  field :email, type: String
  field :birthdate, type: Date

  before_save :encrypt_password
  validates_format_of :email, :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates_uniqueness_of :username, :email

  def self.encrypt(password, salt)
    Digest::SHA2.hexdigest "#{password}/#{salt}"
  end

private

  def encrypt_password
    if self.new_record?
      self.salt = generate_salt
      self.password = User.encrypt(self.password, self.salt)
    end
  end

  def generate_salt
    Digest::SHA2.hexdigest(SecureRandom.uuid)
  end
end
