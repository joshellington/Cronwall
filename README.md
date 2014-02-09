Cronwall
===

Ruby script built to be run as a cron job to download fresh wallpapers daily.

Here's an example cron command to run on OSX (update paths to match your system):

  SHELL=/bin/zsh
  PATH=/Users/josh/.rvm/gems/ruby-2.0.0-p195/bin:/Users/josh/.rvm/gems/ruby-2.0.0-p195@global/bin:/Users/josh/.rvm/rubies/ruby-2.0.0-p195/bin:/Users/josh/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/i486-pc-linux-gnu/gcc-bin/4.5.3
  RUBYLIB=/Users/josh/.rvm/rubies/ruby-2.0.0-p195/lib/ruby/1.9.1
  GEM_HOME='/Users/josh/.rvm/gems/ruby-2.0.0-p195'
  GEM_PATH='/Users/josh/.rvm/gems/ruby-2.0.0-p195:/Users/josh/.rvm/gems/ruby-2.0.0-p195@global'
  RUBYOPT=rubygems
  * * * * * /Users/josh/.rvm/rubies/ruby-2.0.0-p195/bin/ruby /Users/josh/Projects/Cronwall/cronwall.rb >/tmp/stdout.log 2>/tmp/stderr.log