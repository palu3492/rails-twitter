class User < ActiveRecord::Base
  include Clearance::User
  has_many :tweets

  def email_optional?
    true
  end

  def self.authenticate(username, password)
    puts(username)
    puts(password)
    return nil unless (user = find_by_username(username))
    return user if user.authenticated?(password)
  end

end
