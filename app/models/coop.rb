class Coop < ActiveRecord::Base
  belongs_to :user
  belongs_to :major
  has_many :reviews
end
