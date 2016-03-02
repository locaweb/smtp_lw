require_relative '../../test_helper'

describe SmtpLw do
  it 'must give the correct api token' do
    SmtpLw.configure do |c|
      c.api_token = 'secret_token'
    end
    assert_equal SmtpLw.api_token, 'secret_token'
  end

  it 'has to reset the default keys if needed' do
    SmtpLw.configure do |c|
      c.api_token = 'secret_token'
    end
    SmtpLw.reset!
    assert_equal SmtpLw.api_token, ENV['SMTP_LW_API_TOKEN']
  end
end
