class User < ActiveRecord::Base
  include Clearance::User

  has_many :vehicles, foreign_key: 'owner_id'
end
