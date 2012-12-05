class Organization < ActiveRecord::Base

  has_many :users

  validates :name, :industry, :presence => true
  validates :email, :presence => true, :uniqueness => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  
  # For industry type of organization sign up
  INDUSTRY = [
    ['Accountancy', 'Accountancy'],['Automotive & Aerospace', 'Automotive & Aerospace'],['Banking & Finance', 'Banking & Finance'],['Business Consultancy', 'Business Consultancy'],['Communications', 'Communications'],['Construction', 'Construction'],
    ['Document Management', 'Document Management'],['Education', 'Education'],['Fashion & Retail', 'Fashion & Retail'],['Government - National & Local', 'Government - National & Local'],['Human Resources/Training', 'Human Resources/Training'],['Industrial Engineering', 'Industrial Engineering'],
    ['Insurance', 'Insurance'],['IT Services/Software', 'IT Services/Software'],['Legal', 'Legal'],['Libraries', 'Libraries'],['Manufacturing', 'Manufacturing'],['Media/Press/Publishing', 'Media/Press/Publishing'],
    ['Medical/Healthcare', 'Medical/Healthcare'],['Military/Defence', 'Military/Defence'],['Transport/Logistics', 'Transport/Logistics']
  ]
  
end
