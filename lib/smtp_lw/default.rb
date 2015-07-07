module SmtpLw
  module Default
    API_BASE = "https://api.smtplw.com.br".freeze
    API_VERSION = "/v1/".freeze

    class << self
      def api_endpoint
        ENV['SMTP_LW_API_ENDPOINT'] || (API_BASE + API_VERSION)
      end

      def api_token
        ENV['SMTP_LW_API_TOKEN']
      end

      def api_version
        API_VERSION
      end

      def api_base
        ENV['SMTP_LW_API_BASE'] || API_BASE
      end

      def options
        Hash[SmtpLw::Configurable.keys.map{|key| [key, send(key)]}]
      end

      # used for pagination when available on get
      def per_page
        ENV['SMTP_LW_PER_PAGE'] || 100
      end

      def timeout
        ENV['SMTP_LW_TIMEOUT'] || 5
      end
    end
  end
end
