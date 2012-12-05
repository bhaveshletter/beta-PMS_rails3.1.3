class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :full_name, :company_name, :user_type_id, :avatar, :remember_me, :organization_id, :department_id
  # User profile image upload path & url with paperclip
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "75x75>", :small => "100x100>" }, 
    :url =>  "/uploads/:id/:style/:filename",
    :path => ":rails_root/public/uploads/:id/:style/:filename"
  # To get actual user to whom task does assign.
  has_many :responsible_tasks, :class_name => "Task", :foreign_key => "responsible_id"
  has_many :tasks
  has_many :projects
  has_many :project_participants, :class_name => "ProjectParticipant", :foreign_key => "member_id"
  has_many :timecards
  belongs_to :organization

  validates :email, :presence => true
  validates :department_id, :presence => true
  validate :full_name, :presence => true

  # For type of users at time of signup
  DEPARTMENT = [
    ['Manager',1],['QA',2],['Designing',3],['Coding',4]
  ]
  
end
