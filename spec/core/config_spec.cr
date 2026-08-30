require "../spec_helper"

private alias Config = Amazonite::Core::Config

describe Config do
  key = "AKIAIOSFODNN7EXAMPLE"
  secret = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
  region = "us-east-1"
  base_url = "https://dynamodb.com"

  describe "#profile" do
    it "uses value from constructor" do
      config = MockConfig.new(profile: "default")
      config.access_key_id.should eq("AKIABLAHBLAHBLAH")
      config.secret_access_key.should eq("secretSECRET+secret/SECRET")
      config.region.should eq("us-east-1")
    end

    it "uses environment variable if set" do
      env = {"AWS_PROFILE" => "other"}
      config = MockConfig.new(env: MockEnvFetcher.new(env))

      config.access_key_id.should eq("AKIAFOOBARFOOBAR")
      config.secret_access_key.should eq("fooBAR+foo/BAR")
      config.region.should eq("eu-west-2")
    end

    it "uses value from constructor, even if environment variable specified" do
      env = {"AWS_PROFILE" => "other"}
      config = MockConfig.new(profile: "default", env: MockEnvFetcher.new(env))

      config.access_key_id.should eq("AKIABLAHBLAHBLAH")
      config.secret_access_key.should eq("secretSECRET+secret/SECRET")
      config.region.should eq("us-east-1")
    end

    it "prioritises access_key_id/secret_access_key over profile" do
      env = {"AWS_SECRET_ACCESS_KEY" => secret}
      config = MockConfig.new(key, profile: "default", env: MockEnvFetcher.new(env))

      config.access_key_id.should eq(key)        # constructor
      config.secret_access_key.should eq(secret) # environment variable
      config.region.should eq("us-east-1")       # profile
    end
  end

  describe "#endpoint_url" do
    it "defaults to aws link" do
      url = Config.new(key, secret, region).endpoint_url("dynamodb")
      url.should eq("https://dynamodb.us-east-1.amazonaws.com")
    end

    it "use environment variable if set" do
      env = {"AMAZONITE_DYNAMODB_URL" => base_url}
      config = Config.new(key, secret, region, env: MockEnvFetcher.new(env))
      config.endpoint_url("dynamodb").should eq(base_url)
    end

    it "use base url if set" do
      config = Config.new(key, secret, region, base_url: base_url)
      config.endpoint_url("dynamodb").should eq(base_url)
    end

    it "uses base url from constructor, even if environment variable specified" do
      env = {"AMAZONITE_DYNAMODB_URL" => base_url}
      config = Config.new(key, secret, region, base_url: "https://localhost:4566", env: MockEnvFetcher.new(env))
      config.endpoint_url("dynamodb").should eq("https://localhost:4566")
    end
  end

  describe "#access_key_id" do
    it "uses value from constructor" do
      config = Config.new(key, secret, region)
      config.access_key_id.should eq(key)
    end

    it "uses 'AWS_ACCESS_KEY_ID' environment variable when available" do
      env = {"AWS_ACCESS_KEY_ID" => key}
      config = Config.new(secret_access_key: secret, region: region, env: MockEnvFetcher.new(env))
      config.access_key_id.should eq(key)
    end

    it "uses value from constructor, even if environment variable specified" do
      env = {"AWS_ACCESS_KEY_ID" => "blahblah"}
      config = Config.new(key, secret, region, env: MockEnvFetcher.new(env))
      config.access_key_id.should eq(key)
    end

    it "raises an error if no key can be resolved" do
      expect_raises(Exception, "no access_key_id provided via constructor or environment variable (AWS_ACCESS_KEY_ID)") do
        Config.new(secret_access_key: secret, region: region, env: MockEnvFetcher.new({} of String => String))
      end
    end
  end

  describe "#secret_access_key" do
    it "uses value from constructor" do
      config = Config.new(key, secret, region)
      config.secret_access_key.should eq(secret)
    end

    it "uses 'AWS_SECRET_ACCESS_KEY' environment variable when available" do
      env = {"AWS_SECRET_ACCESS_KEY" => secret}
      config = Config.new(key, region: region, env: MockEnvFetcher.new(env))
      config.secret_access_key.should eq(secret)
    end

    it "uses value from constructor, even if environment variable specified" do
      env = {"AWS_SECRET_ACCESS_KEY" => "haha"}
      config = Config.new(key, secret, region, env: MockEnvFetcher.new(env))
      config.secret_access_key.should eq(secret)
    end

    it "raises an error if no secret can be resolved" do
      expect_raises(Exception, "no secret_access_key provided via constructor or environment variable (AWS_SECRET_ACCESS_KEY)") do
        Config.new(key, region: region, env: MockEnvFetcher.new({} of String => String))
      end
    end
  end

  describe "#region" do
    it "uses value from constructor" do
      config = Config.new(key, secret, region)
      config.region.should eq(region)
    end

    it "uses 'AWS_DEFAULT_REGION' environment variable when available" do
      env = {"AWS_DEFAULT_REGION" => region}
      config = Config.new(key, secret, env: MockEnvFetcher.new(env))
      config.region.should eq(region)
    end

    it "uses 'AWS_REGION' environment variable when available" do
      env = {"AWS_REGION" => "us-west-2"}
      config = Config.new(key, secret, env: MockEnvFetcher.new(env))
      config.region.should eq("us-west-2")
    end

    it "allows 'AWS_REGION' environment variable to override 'AWS_DEFAULT_REGION'" do
      env = {"AWS_DEFAULT_REGION" => region, "AWS_REGION" => "us-west-2"}
      config = Config.new(key, secret, env: MockEnvFetcher.new(env))
      config.region.should eq("us-west-2")
    end

    it "uses value from constructor, even if environment variable specified" do
      env = {"AWS_DEFAULT_REGION" => "us-west-1", "AWS_REGION" => "us-west-2"}
      config = Config.new(key, secret, region, env: MockEnvFetcher.new(env))
      config.region.should eq(region)
    end

    it "raises an error if no region can be resolved" do
      expect_raises(Exception, "no region provided via constructor or environment variable (AWS_REGION or AWS_DEFAULT_REGION)") do
        Config.new(key, secret, env: MockEnvFetcher.new({} of String => String))
      end
    end
  end

  describe "#session_token" do
    it "is nil by default" do
      Config.new(key, secret, region).session_token.should be_nil
    end

    it "uses value from constructor" do
      Config.new(key, secret, region, session_token: "a-token").session_token.should eq("a-token")
    end

    it "uses 'AWS_SESSION_TOKEN' environment variable when available" do
      env = {"AWS_SESSION_TOKEN" => "env-token"}
      config = Config.new(key, secret, region, env: MockEnvFetcher.new(env))
      config.session_token.should eq("env-token")
    end
  end

  describe "#expiration" do
    it "is nil for static credentials" do
      Config.new(key, secret, region).expiration.should be_nil
    end
  end

  describe "AssumeRole fallback" do
    it "falls through env vars and static profile keys into AssumeRole" do
      response = <<-XML
        <AssumeRoleResponse xmlns="https://sts.amazonaws.com/doc/2011-06-15/">
          <AssumeRoleResult>
            <Credentials>
              <AccessKeyId>ASIAEXAMPLE</AccessKeyId>
              <SecretAccessKey>secretExampleKey</SecretAccessKey>
              <SessionToken>exampleSessionToken</SessionToken>
              <Expiration>2099-01-01T00:00:00Z</Expiration>
            </Credentials>
          </AssumeRoleResult>
        </AssumeRoleResponse>
        XML
      WebMock.stub(:post, "https://sts.us-east-1.amazonaws.com/").to_return(body: response)

      config = MockConfig.new(region: region, profile: "assume-role-profile", env: MockEnvFetcher.new({} of String => String))
      config.access_key_id.should eq("ASIAEXAMPLE")
      config.secret_access_key.should eq("secretExampleKey")
      config.session_token.should eq("exampleSessionToken")
    end
  end

  describe "no credentials resolvable" do
    it "raises a combined error covering every credential source" do
      env = MockEnvFetcher.new({"AWS_EC2_METADATA_DISABLED" => "true"})
      expect_raises(Exception, "no AWS credentials found for profile 'nonexistent-profile'") do
        MockConfig.new(region: region, profile: "nonexistent-profile", env: env)
      end
    end
  end

  describe "timeouts" do
    it "defaults to nil for every timeout" do
      config = Config.new(key, secret, region)
      config.dns_timeout.should be_nil
      config.connect_timeout.should be_nil
      config.read_timeout.should be_nil
      config.write_timeout.should be_nil
    end

    it "accepts Time::Span values" do
      config = Config.new(
        key, secret, region,
        dns_timeout: 1.5.seconds, connect_timeout: 2.seconds,
        read_timeout: 3.seconds, write_timeout: 4.seconds,
      )
      config.dns_timeout.should eq(1.5.seconds)
      config.connect_timeout.should eq(2.seconds)
      config.read_timeout.should eq(3.seconds)
      config.write_timeout.should eq(4.seconds)
    end

    it "accepts Number values and converts them to seconds" do
      config = Config.new(
        key, secret, region,
        dns_timeout: 1, connect_timeout: 2, read_timeout: 3, write_timeout: 4,
      )
      config.dns_timeout.should eq(1.seconds)
      config.connect_timeout.should eq(2.seconds)
      config.read_timeout.should eq(3.seconds)
      config.write_timeout.should eq(4.seconds)
    end
  end

  describe "#validate_input?" do
    it "defaults to true" do
      Config.new(key, secret, region).validate_input?.should be_true
    end

    it "can be disabled from the constructor" do
      Config.new(key, secret, region, validate_input: false).validate_input?.should be_false
    end
  end

  describe "#user_agent" do
    it "uses default user agent" do
      config = MockConfig.new(key, secret, region)
      expected = "amazonite/0.1.1 Crystal/1.5.0/41573fadc llvm/13.0.2 arch/arm_64-unknown-linux-gnu command/mycommand"
      config.user_agent { |agent| "#{agent} command/mycommand" }.should eq(expected)
    end

    it "allows setting the user agent" do
      config = MockConfig.new(key, secret, region, user_agent: "another value")
      config.user_agent { |agent| "#{agent} command/mycommand" }.should eq("another value")
    end
  end
end
