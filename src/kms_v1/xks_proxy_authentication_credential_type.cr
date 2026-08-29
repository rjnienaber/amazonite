module Amazonite::KmsV1
  class XksProxyAuthenticationCredentialType
    include JSON::Serializable

    @[JSON::Field(key: "AccessKeyId")]
    property access_key_id : String

    @[JSON::Field(key: "RawSecretAccessKey")]
    property raw_secret_access_key : String

    def initialize(
      @access_key_id : String,
      @raw_secret_access_key : String,
    )
    end
  end
end
