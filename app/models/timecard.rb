class Timecard < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :task

  ROLE = [
    ['Project Manager', 'Project Manager'],['QA', 'QA'],['Designing', 'Designing'],['Coding', 'Coding']
  ]

  validates :project_id, :presence => true
  validates :time_duration, :presence => true
  validates :role, :presence => true

 end
