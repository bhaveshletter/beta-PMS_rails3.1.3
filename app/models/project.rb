class Project < ActiveRecord::Base
  attr_accessible :name, :description

  belongs_to :user
  has_many :project_participants
  has_many :tasks
  has_many :milestones
  has_many :timecards

  validates :name, :presence => true
  validates :description, :presence => true
  
end
