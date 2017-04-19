class User < ActiveRecord::Base
  has_many :posts
  has_many :user_addresses
  has_many :addresses, through: :user_addresses
end

class Post < ActiveRecord::Base
  belongs_to :user
end

class Address < ActiveRecord::Base
  has_many :user_addresses
  has_many :users, through: :user_addresses
end

class UserAddress < ActiveRecord::Base
  belongs_to :user
  belongs_to :address
end
