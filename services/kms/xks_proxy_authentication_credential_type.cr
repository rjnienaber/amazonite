private alias Core = Amazonite::Core

module Amazonite::Kms
  # KMS uses the authentication credential to sign requests that it sends to the external key store
  # proxy (XKS proxy) on your behalf. You establish these credentials on your external key store
  # proxy and report them to KMS.
  #
  # The `XksProxyAuthenticationCredential` includes two required elements.
  class XksProxyAuthenticationCredentialType
    include JSON::Serializable

    # A unique identifier for the raw secret access key.
    @[JSON::Field(key: "AccessKeyId")]
    property access_key_id : String

    # A secret string of 43-64 characters. Valid characters are a-z, A-Z, 0-9, /, +, and =.
    @[JSON::Field(key: "RawSecretAccessKey")]
    property raw_secret_access_key : String

    def initialize(
      @access_key_id : String,
      @raw_secret_access_key : String,
    )
    end

    def validate! : Nil
      if value = @access_key_id
        raise Core::ValidationError.new("AccessKeyId length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("AccessKeyId length must be <= 30") if value.size > 30
        raise Core::ValidationError.new("AccessKeyId does not match the required pattern") unless value.matches?(Regex.new("^[A-Z2-7]+$"))
      end

      if value = @raw_secret_access_key
        raise Core::ValidationError.new("RawSecretAccessKey length must be >= 43") if value.size < 43
        raise Core::ValidationError.new("RawSecretAccessKey length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("RawSecretAccessKey does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9\\/+=]+$"))
      end
    end

    def_equals_and_hash(@access_key_id, @raw_secret_access_key)
  end
end
