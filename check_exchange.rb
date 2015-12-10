require 'viewpoint'
include Viewpoint::EWS

class EmailUser

  attr_reader :name, :email_address, :servertype, :user, :pass, :server
  
  def initialize(name,email_address,servertype,user,pass,server)
    @name = name
    @email_address = email_address
    @servertype = servertype
    @user = user
    @pass = pass
    @server = server
  end
    
end

def check_email(u_email,subject)
  date=nil
  conversation_id=nil
  result = Hash.new
  check = false
    
  ews = Viewpoint::EWSClient.new u_email.server, u_email.user, u_email.pass
    
  inbox = ews.get_folder_by_name 'inbox'
  items = inbox.search_by_subject subject
  items.each do  |i|       
    if i.subject == subject        
      date = i.date_time_sent
      conversation_id = i.conversation_id
      check = true 
    end              
  end  
  result["status"]=check
  result["subject"]=subject
  result["user"]=u_email.email_address  
  result["date"]=date  
  result["conversation_id"]=conversation_id  
  
  return result
  
end

u_email = EmailUser.new "<name>","<email address>","EWS","<username>","<password>","https://<server>/ews/Exchange.asmx"

subject = "<Known subject>"

result = check_email(u_email,subject)

result.each { |k,v| puts "#{k}:#{v}"}
