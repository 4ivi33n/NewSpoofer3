class MailsController < ApplicationController
  def index
     @mails = Mail.all
  end

  def show
	@mail = Mail.find(params[:id])
  end

  def new
	@mail  = Mail.new
  end

  def create
	@mail = Mail.new(params[:mail])
	if @mail.save
		m = MailerController.new(:from=>@mail.from,:to=>@mail.to,:from_name=>@mail.from_name,:message=>@mail.message,:subject=>@mail.subject)
		m.sendmail
		redirect_to mails_path, :notice=>"your mail successfully sent"
	else 

		render "new"
	end
  end



  def destroy
	@mail = Mail.find(params[:id])
	@mail.destroy
	redirect_to mails_path, :notice=>"Mail deleted"

  end

end
