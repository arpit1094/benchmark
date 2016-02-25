require 'google/apis/gmail_v1'
load 'quickstart.rb'
# Initialize the API
  @service = Google::Apis::GmailV1::GmailService.new
  @service.client_options.application_name = APPLICATION_NAME
  @service.authorization = authorize
  # Show the user's labels
  @user_id = 'me'
  
def fetch_rest(counter)
  r = @service.list_user_messages(@user_id)
  result = Array.new
  (0..(counter-1)).each do |i|
    result.push(@service.get_user_message(@user_id,r.messages[i].id))
  end
end

def read_unread_rest(counter)
  r = @service.list_user_messages(@user_id)
  (0..(counter-1)).each do |i|
    result = @service.get_user_message(@user_id,r.messages[i].id)
      req = Google::Apis::GmailV1::ModifyMessageRequest.new
      req.remove_label_ids = ["UNREAD"]
      @service.modify_message(@user_id,r.messages[i].id,req)
      req = Google::Apis::GmailV1::ModifyMessageRequest.new
      req.add_label_ids = ["UNREAD"]
      @service.modify_message(@user_id,r.messages[i].id,req)
  end
end

#fetch_rest(10)
=begin
result = service.get_user_message(user_id,"1530cd2625690411")
def print_message_part_header(message_part_header,sp)
  puts "#{sp}message part header name is ->  #{message_part_header.name}"
  puts "#{sp}message part header value is ->  #{message_part_header.value}"
end

def print_message_part_body(message_part_body,sp)
  puts "#{sp}message part body attachment_id is -> #{message_part_body.attachment_id}"
  puts "#{sp}message part body data is -> #{message_part_body.data}"
  puts "#{sp}message part body size is -> #{message_part_body.size}"
end

def print_message_part(message_part,sp)
    puts "#{sp}message part body is ->"
    print_message_part_body(message_part.body,sp+"  ")
    puts "#{sp}message part filename is -> #{message_part.filename}"
    puts "#{sp}message part mime_type is -> #{message_part.mime_type}"
    puts "#{sp}message part part_id is -> #{message_part.part_id}"
    puts "#{sp}message part parts are ->"
    puts "#{sp}-----------------------------------------------"
    if (message_part.parts)
      message_part.parts.each do |msg_part|
        print_message_part(msg_part,sp+"  ")
        puts "#{sp}-----------------------------------------------"
      end
    end
end

def print_message(message,sp)
  puts "#{sp}message history_id is -> #{message.history_id}"
  puts "#{sp}message id is -> #{message.id}"
  puts "#{sp}message internal_date is -> #{message.internal_date}"
  puts "#{sp}message label_ids are -> #{message.label_ids}"
  puts "#{sp}message payload is ->"
  print_message_part(message.payload,sp+"  ")
  puts "#{sp}message raw is -> #{message.raw}"
  puts "#{sp}message size_estimate is -> #{message.size_estimate}"
  puts "#{sp}message snippet is -> #{message.snippet}"
  puts "#{sp}message thread_id is -> #{message.thread_id}"
end
print_message(result,"")
=end