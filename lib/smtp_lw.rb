module SmtpLw
  require 'smtp_lw/version'
  require 'smtp_lw/default'
  require 'smtp_lw/configurable'
  require 'smtp_lw/client'
  require 'dotenv'

  class << self
    Dotenv.load
    include SmtpLw::Configurable
  end
end
