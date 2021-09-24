# vim: filetype=muttrc
set mbox_type = Maildir

set from      = "shishqa.main@gmail.com"
set realname  = "Mikhail Shishatskiy"

# set folder    = "/mnt/WorkDisk/share/mail/personal/shishqa.main/"
set smtp_url  = "smtps://shishqa.main@gmail.com@smtp.gmail.com:465"
set smtp_pass = `pass show neomutt/shishqa.main@gmail.com`

set spoolfile = "+personal/shishqa.main/inbox"
set record    = "+personal/shishqa.main/sent"
set trash     = "+personal/shishqa.main/trash"
set spam      = "+personal/shishqa.main/spam"
set postponed = "+personal/shishqa.main/drafts"
