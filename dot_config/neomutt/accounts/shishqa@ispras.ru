# vim: filetype=muttrc

# set mbox_type = Maildir

set from      = "shishqa@ispras.ru"
set realname  = "Mikhail Shishatskiy"

set imap_user = "shishqa@ispras.ru"
set imap_pass = `pass show mail.ispras.ru`

set smtp_url  = "smtps://shishqa@ispras.ru@mail.ispras.ru:465"
set smtp_pass = `pass show mail.ispras.ru`

set folder = "imaps://mail.ispras.ru:993"
#set spoolfile = "+ispras/inbox"
#set record    = "+ispras/sent"
#set trash     = "+ispras/trash"
#set postponed = "+ispras/drafts"
