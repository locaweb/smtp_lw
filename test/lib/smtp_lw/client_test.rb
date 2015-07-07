require_relative '../../test_helper'

describe SmtpLw::Client do

  subject { SmtpLw::Client }

  it "must return authentication options of client" do
    client = subject.new(api_token: 'my_api_key')
    assert_equal client.api_token, "my_api_key"
  end

end
