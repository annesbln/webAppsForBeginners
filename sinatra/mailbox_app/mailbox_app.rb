require 'sinatra'
enable :sessions
load 'email.rb'
load 'mailbox.rb'
load 'mailbox_html_formatter.rb'
load 'email_csv_store.rb'


get "/mailbox" do
  store = EmailsCsvStore.new("emails.csv")
  emails = store.read

  mailbox = Mailbox.new("Ruby Study Group", emails)
  formatter = MailboxHtmlFormatter.new(mailbox)
  
  File.write("views/mailbox.erb", formatter.format)
  erb :mailbox
end
