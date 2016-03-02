require_relative '../../test_helper'

describe SmtpLw do
  it 'must give the correct api endpoint' do
    assert_equal SmtpLw::Default.api_endpoint, 'https://api.smtplw.com.br/v1/'
  end
end
