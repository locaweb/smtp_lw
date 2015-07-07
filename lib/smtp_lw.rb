module SmtpLw
  require "smtp_lw/version"
  require "smtp_lw/default"
  require "smtp_lw/configurable"
  require "smtp_lw/client"
  class << self
    include SmtpLw::Configurable
  end

end
