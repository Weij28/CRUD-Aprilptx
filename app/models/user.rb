require 'digest'

module Hasher
  def encrypt(password)
    Digest::SHA1.hexdigest(password)
  end
  def salted(password)
    e"123#{password}xx"
  end
end 


class User < ApplicationRecord
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /.+\@.+\..+/ }

  validates :password, presence: true,
                       confirmation: true

  before_create :encrypt_password

  def self.login(params)
    email = params[:email]
    password = params[:password]

    encrypted_password = salted(password)

    find_by(email: email, password: encrypted_password)
  end

  private
  def encrypt_password
    salted_pwd = Hasher.salted(password)
    self.password = Hasher.encrypt(salted_pwd)
    # self.password = Digest::SHA1.hexdigest(password)
    # self.password=(Digest::SHA1.hexdigest(password))
    # password = Digest::SHA1.hexdigest(password)
  end



end
