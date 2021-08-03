# vim: filetype=muttrc
set mbox_type = Maildir

set from      = "shishqa@ispras.ru"
set realname  = "Mikhail Shishatskiy"

# set folder    = "/mnt/WorkDisk/share/mail/ispras/"
set smtp_url  = "smtps://shishqa@ispras.ru@mail.ispras.ru:465"
set smtp_pass = `pass show ispras/mail`

set spoolfile = "+ispras/inbox"
set record    = "+ispras/sent"
set trash     = "+ispras/trash"
set postponed = "+ispras/drafts"
