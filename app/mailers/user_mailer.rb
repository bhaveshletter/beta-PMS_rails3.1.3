class UserMailer < ActionMailer::Base
  default :from => "test@test.com"
  
  def welcome_instruction(user)
    @user = user
    mail(:to => user.email, :subject => "InxPMS | Welcome")
  end

  def task_assignment(user)
    @user_task = user
    mail(:to => user.responsible_user.email, :subject => "InxPMS | Task assignment")
  end

  def send_user_details(user)
    @user = user
    mail(:to => user.email,:subject => "Welcome InxPMS" )
  end



end
