class Task < ActiveRecord::Base
#  after_create :task_mail

  has_many :timecards
  belongs_to :user
  belongs_to :project
  # To get actual user to whom task does assign.
  belongs_to :responsible_user, :class_name => "User", :foreign_key => "responsible_id"
  belongs_to :milestone
  validates :name, :presence => true,
    :length     => { :within => 3..50 }

  validates :description, :presence => true,
    :length     => { :within => 10..500 }

=begin
  # To send mail to user whom task has been assigned.
  def task_mail
    unless self.responsible_id.nil?
      UserMailer.task_assignment(self).deliver
    end
  end
=end
end
