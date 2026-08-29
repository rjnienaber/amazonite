require "http/client"
require "./credentials_provider"

module Amazonite::Core
  # EC2 instance profile credentials via IMDSv2 - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html
  class InstanceMetadataCredentialsProvider < CredentialsProvider
    Log       = ::Log.for(self)
    IMDS_HOST = "169.254.169.254"

    def initialize(@env : Fetcher, @connect_timeout : Time::Span = 1.second, @read_timeout : Time::Span = 1.second)
    end

    # broad rescue is deliberate: off an EC2 host there is no config signal
    # distinguishing "not applicable" from "broken," and this must never
    # hang or raise into a caller building a Config on a non-EC2 machine
    def credentials : Credentials?
      return if @env["AWS_EC2_METADATA_DISABLED"]?.try(&.downcase) == "true"

      token = fetch_token
      return unless token

      role_name = fetch_role_name(token)
      return unless role_name

      fetch_role_credentials(token, role_name)
    rescue ex
      Log.debug { "EC2 instance metadata service unavailable: #{ex.message}" }
      nil
    end

    private def http_client : HTTP::Client
      client = HTTP::Client.new(IMDS_HOST)
      client.connect_timeout = @connect_timeout
      client.read_timeout = @read_timeout
      client
    end

    private def fetch_token : String?
      headers = HTTP::Headers{"X-aws-ec2-metadata-token-ttl-seconds" => "21600"}
      response = http_client.put("/latest/api/token", headers)
      response.body if response.success?
    end

    private def fetch_role_name(token : String) : String?
      headers = HTTP::Headers{"X-aws-ec2-metadata-token" => token}
      response = http_client.get("/latest/meta-data/iam/security-credentials/", headers)
      return unless response.success?
      response.body.lines.first?
    end

    private def fetch_role_credentials(token : String, role_name : String) : Credentials?
      headers = HTTP::Headers{"X-aws-ec2-metadata-token" => token}
      response = http_client.get("/latest/meta-data/iam/security-credentials/#{role_name}", headers)
      return unless response.success?
      AwsCredentialsJson.from_json(response.body).to_credentials
    end
  end
end
