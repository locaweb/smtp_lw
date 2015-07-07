module SmtpLw
  module Configurable
    attr_accessor :api_token, :api_endpoint, :per_page, :timeout

    class << self
      def keys
        @keys ||= [
          :api_token,
          :api_endpoint,
          :per_page,
          :timeout
        ]
      end
    end

    def api_token
      @api_token || SmtpLw::Default.api_token
    end

    # Base endpoint URL for generated web URLs
    # Referenced by SmtpLw.api_endpoint
    # @return [String] Default: https://api.smtplw.com.br/v1/
    def api_endpoint
      @api_endpoint || SmtpLw::Default.api_endpoint
    end

    def per_page
      @per_page || SmtpLw::Default.per_page
    end

    def timeout
      @timeout || SmtpLw::Default.timeout
    end

    # Set configuration options using a block
    def configure
      yield self
    end

    def reset!
      SmtpLw::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", SmtpLw::Default.options[key])
      end
      self
    end

  end
end

