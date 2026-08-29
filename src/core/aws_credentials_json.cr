require "json"
require "time"

module Amazonite::Core
  # shared JSON shape returned by both the ECS/Fargate container credentials
  # endpoint and the EC2 instance metadata security-credentials endpoint
  class AwsCredentialsJson
    include JSON::Serializable

    @[JSON::Field(key: "AccessKeyId")]
    getter access_key_id : String

    @[JSON::Field(key: "SecretAccessKey")]
    getter secret_access_key : String

    @[JSON::Field(key: "Token")]
    getter token : String

    @[JSON::Field(key: "Expiration")]
    getter expiration : String

    def to_credentials : Credentials
      Credentials.new(access_key_id, secret_access_key, token, Time.parse_iso8601(expiration))
    end
  end
end
