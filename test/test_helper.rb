require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/reporters'
require 'byebug'
require 'vcr'
require 'dotenv'
require File.expand_path('../../lib/smtp_lw.rb', __FILE__)

Dotenv.load

VCR.configure do |c|
  ENV['SMTP_LW_API_TOKEN'] = 'my-api-test-token'

  c.cassette_library_dir = "test/fixtures"
  c.hook_into :webmock
  c.filter_sensitive_data("<STMP_LW_API_TOKEN>") do
    test_api_token
  end
end

def test_api_token
  ENV.fetch 'SMTP_LW_API_TOKEN', 'my-api-test-token'
end

module Minitest
  module Reporters
    class CustomReporter < DefaultReporter
      GRAY = '0;36'
      GREEN = '1;32'
      RED = '1;31'

      def initialize(options = {})
        super
        @slow_threshold = options.fetch(:slow_threshold, nil)
      end

      def record_pass(test)
        if @slow_threshold.nil? || test.time <= @slow_threshold
          super
        else
          gray('O')
        end
      end

      def color_up(string, color)
        color? ? "\e\[#{ color }m#{ string }#{ ANSI::Code::ENDCODE }" : string
      end

      def red(string)
        color_up(string, RED)
      end

      def green(string)
        color_up(string, GREEN)
      end

      def gray(string)
        color_up(string, GRAY)
      end
    end
  end
end

reporter_options = { color: true, slow_count: 5 }
Minitest::Reporters.use! [Minitest::Reporters::CustomReporter.new(reporter_options)]
