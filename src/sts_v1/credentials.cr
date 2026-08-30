private alias Core = Amazonite::Core

module Amazonite::StsV1
  # Amazon Web Services credentials for API authentication.
  class Credentials
    # The access key ID that identifies the temporary security credentials.
    property access_key_id : String

    # The secret access key that can be used to sign requests.
    property secret_access_key : String

    # The token that users must pass to the service API to use the temporary credentials.
    property session_token : String

    # The date on which the current credentials expire.
    property expiration : Time

    def initialize(
      @access_key_id : String,
      @secret_access_key : String,
      @session_token : String,
      @expiration : Time,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}AccessKeyId", @access_key_id}

      params << {"#{prefix}SecretAccessKey", @secret_access_key}

      params << {"#{prefix}SessionToken", @session_token}

      params << {"#{prefix}Expiration", Core::QueryValue.time(@expiration)}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        access_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AccessKeyId']")).not_nil!,
        secret_access_key: Core::XMLValue.string(node.xpath_node("*[local-name()='SecretAccessKey']")).not_nil!,
        session_token: Core::XMLValue.string(node.xpath_node("*[local-name()='SessionToken']")).not_nil!,
        expiration: Core::XMLValue.time(node.xpath_node("*[local-name()='Expiration']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @access_key_id
        raise Core::ValidationError.new("AccessKeyId length must be >= 16") if value.size < 16
        raise Core::ValidationError.new("AccessKeyId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("AccessKeyId does not match the required pattern") unless value.matches?(Regex.new("^[\\w]*$"))
      end
    end

    def_equals_and_hash(@access_key_id, @secret_access_key, @session_token, @expiration)
  end
end
