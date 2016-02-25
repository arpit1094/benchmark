load 'imap.rb'
load 'rest.rb'

(1..10).each do |i|

  i_s = Time.now
  fetch_imap(i*10)
  i_t = (Time.now - i_s)
  
  r_s =Time.now
  fetch_rest(i*10)
  r_t = (Time.now - r_s)
  puts "for fetching #{i*10} mails\timap = #{i_t}\trest = #{r_t}"

end

(1..10).each do |i|

  i_s = Time.now
  read_unread_imap(i*10)
  i_t = (Time.now - i_s)
  
  r_s =Time.now
  read_unread_rest(i*10)
  r_t = (Time.now - r_s)
  puts "for marking #{i*10} mails read and unread\timap = #{i_t}\trest = #{r_t}"

end