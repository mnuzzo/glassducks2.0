class Review < ActiveRecord::Base
  belongs_to :coop
  belongs_to :user
end
