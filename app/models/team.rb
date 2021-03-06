class Team < ActiveRecord::Base
  belongs_to :user
  has_many :relationships, dependent: :destroy
  has_many :members, through: :relationships, source: :user

  has_many :preferences, dependent: :destroy
  has_many :prefers, through: :preferences, source: :project

  validates :name, presence: true, uniqueness: true
  validates :user_id, presence: true

  def leader
  	self.user
  end

  def is_leader?(user)
  	self.leader == user
  end

 
end
