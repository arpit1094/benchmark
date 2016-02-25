require 'mail'

  Mail.defaults do
    retriever_method :imap, { :address             => "imap.googlemail.com",
                              :port                => 993,
                              :user_name           => 'your_username',
                              :password            => 'your_password',
                              :enable_ssl          => true }
  end

def fetch_imap(counter)

  emails = Mail.find(:what => :last, :count => counter, order: :asc )

end

def read_unread_imap(counter)

  Mail.find(:what => :last, :count => counter, order: :asc ) do |email, imap, uid|
    imap.uid_store( uid, "+FLAGS", [Net::IMAP::SEEN] )
    imap.uid_store( uid, "-FLAGS", [Net::IMAP::SEEN] )
  end
end
#fetch_imap(10)