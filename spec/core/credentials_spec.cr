require "../spec_helper"

private alias Credentials = Amazonite::Core::Credentials

describe Credentials do
  describe "#expired?" do
    it "is never expired when there is no expiration" do
      creds = Credentials.new("key", "secret")
      creds.expired?.should be_false
    end

    it "is expired once past the expiration" do
      creds = Credentials.new("key", "secret", expiration: Time.utc - 1.minute)
      creds.expired?.should be_true
    end

    it "is expired within the refresh buffer, even if not technically past expiration" do
      creds = Credentials.new("key", "secret", expiration: Time.utc + 30.seconds)
      creds.expired?.should be_true
    end

    it "is not expired outside the refresh buffer" do
      creds = Credentials.new("key", "secret", expiration: Time.utc + 1.hour)
      creds.expired?.should be_false
    end
  end
end
