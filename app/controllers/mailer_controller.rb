class MailerController < ApplicationController
require 'net/smtp' 
   def initialize(args)
      @from = args[:from]
      @from_name = args[:from_name] || ""
      @to = args[:to] 
      @subject = args[:subject] || ""
      @message = args[:message] || ""
  end
   def construct_message
      msg = "To: #{@to}\n"
      msg += "Subject: #{@subject}\n"
      msg += %Q(From: "#{@from_name}" <#{@from}>\n)
      #msg+= "From: #{@from}\n"
      msg+= "Reply-To: #{@from}\n"
      msg += "Date: #{Time.now}\n"
      msg += "Content-Type: text/plain; charset=utf-8\n\n"
      msg += @message
      msg
   end

   def sendmail
      smtp_server = 'smtp.elasticemail.com'
      smtp_port = 2525
      smtp = Net::SMTP.new smtp_server,smtp_port
      domain = "xyz@xyz.com"
      user = "ego.alternate@gmail.com"
      password = "e8b741aa-45ff-4cda-9060-d623153d2610"
      begin
        smtp.start(domain,user,password,:login) do
          smtp.send_message(construct_message,@from,@to)
        end
      rescue
        print "error occured"
      end
    end
end
