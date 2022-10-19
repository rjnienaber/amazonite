require "../spec_helper"

describe Amazonite::Core::Config do
  key = "AKIAIOSFODNN7EXAMPLE"
  secret = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
  region = "us-east-1"
  base_url = "https://dynamodb.com"

  describe "#endpoint_url" do
    it "defaults to aws link" do
      url = Amazonite::Core::Config.new(key, secret, region).endpoint_url("dynamodb")
      url.should eq("dynamodb.us-east-1.amazonaws.com")
    end

    it "use environment variable if set" do
      env = {"AMAZONITE_DYNAMODB_URL" => base_url}
      config = Amazonite::Core::Config.new(key, secret, region, env: MockEnvFetcher.new(env))
      config.endpoint_url("dynamodb").should eq(base_url)
    end

    it "use base url if set" do
      config = Amazonite::Core::Config.new(key, secret, region, base_url)
      config.endpoint_url("dynamodb").should eq(base_url)
    end

    it "uses base url from constructor, even if environment variable specified" do
      env = {"AMAZONITE_DYNAMODB_URL" => base_url}
      config = Amazonite::Core::Config.new(key, secret, region, base_url: "https://localhost:4566", env: MockEnvFetcher.new(env))
      config.endpoint_url("dynamodb").should eq("https://localhost:4566")
    end
  end

  describe "#access_key_id" do
    it "uses value from constructor" do
      config = Amazonite::Core::Config.new(key, secret, region)
      config.access_key_id.should eq(key)
    end

    it "uses 'AWS_ACCESS_KEY_ID' environment variable when available" do
      env = {"AWS_ACCESS_KEY_ID" => key}
      config = Amazonite::Core::Config.new(secret_access_key: secret, region: region, env: MockEnvFetcher.new(env))
      config.access_key_id.should eq(key)
    end

    it "uses value from constructor, even if environment variable specified" do
      env = {"AWS_ACCESS_KEY_ID" => "blahblah"}
      config = Amazonite::Core::Config.new(key, secret, region, env: MockEnvFetcher.new(env))
      config.access_key_id.should eq(key)
    end

    it "raises an error if no key can be resolved" do
      expect_raises(Exception, "no access_key_id provided via constructor or environment variable (AWS_ACCESS_KEY_ID)") do
        Amazonite::Core::Config.new(secret_access_key: secret, region: region, env: MockEnvFetcher.new({} of String => String))
      end
    end
  end

  describe "#secret" do
    it "uses value from constructor" do
      config = Amazonite::Core::Config.new(key, secret, region)
      config.secret_access_key.should eq(secret)
    end

    it "uses 'AWS_SECRET_ACCESS_KEY' environment variable when available" do
      env = {"AWS_SECRET_ACCESS_KEY" => secret}
      config = Amazonite::Core::Config.new(key, region: region, env: MockEnvFetcher.new(env))
      config.secret_access_key.should eq(secret)
    end

    it "uses value from constructor, even if environment variable specified" do
      env = {"AWS_SECRET_ACCESS_KEY" => "haha"}
      config = Amazonite::Core::Config.new(key, secret, region, env: MockEnvFetcher.new(env))
      config.secret_access_key.should eq(secret)
    end

    it "raises an error if no secret can be resolved" do
      expect_raises(Exception, "no secret_access_key provided via constructor or environment variable (AWS_SECRET_ACCESS_KEY)") do
        Amazonite::Core::Config.new(key, region: region, env: MockEnvFetcher.new({} of String => String))
      end
    end
  end

  describe "#region" do
    it "uses value from constructor" do
      config = Amazonite::Core::Config.new(key, secret, region)
      config.region.should eq(region)
    end

    it "uses 'AWS_DEFAULT_REGION' environment variable when available" do
      env = {"AWS_DEFAULT_REGION" => region}
      config = Amazonite::Core::Config.new(key, secret, env: MockEnvFetcher.new(env))
      config.region.should eq(region)
    end

    it "uses 'AWS_REGION' environment variable when available" do
      env = {"AWS_REGION" => "us-west-2"}
      config = Amazonite::Core::Config.new(key, secret, env: MockEnvFetcher.new(env))
      config.region.should eq("us-west-2")
    end

    it "allows 'AWS_REGION' environment variable to override 'AWS_DEFAULT_REGION'" do
      env = {"AWS_DEFAULT_REGION" => region, "AWS_REGION" => "us-west-2"}
      config = Amazonite::Core::Config.new(key, secret, env: MockEnvFetcher.new(env))
      config.region.should eq("us-west-2")
    end

    it "uses value from constructor, even if environment variable specified" do
      env = {"AWS_DEFAULT_REGION" => "us-west-1", "AWS_REGION" => "us-west-2"}
      config = Amazonite::Core::Config.new(key, secret, region, env: MockEnvFetcher.new(env))
      config.region.should eq(region)
    end

    it "raises an error if no region can be resolved" do
      expect_raises(Exception, "no region provided via constructor or environment variable (AWS_REGION or AWS_DEFAULT_REGION)") do
        Amazonite::Core::Config.new(key, secret, env: MockEnvFetcher.new({} of String => String))
      end
    end
  end

  describe "#user_agent" do
    it "uses default user agent" do
      config = MockConfig.new(key, secret, region)
      expected = "amazonite/0.1.1 Crystal/1.5.0/41573fadc llvm/13.0.2 arch/arm_64-unknown-linux-gnu command/mycommand"
      config.user_agent { |u| "#{u} command/mycommand" }.should eq(expected)
    end

    it "allows setting the user agent" do
      config = MockConfig.new(key, secret, region, user_agent: "another value")
      config.user_agent { |u| "#{u} command/mycommand" }.should eq("another value")
    end
  end
end
