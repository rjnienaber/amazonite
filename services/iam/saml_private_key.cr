private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains the private keys for the SAML provider.
  #
  # This data type is used as a response element in the
  # [GetSAMLProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetSAMLProvider.html)
  # operation.
  class SAMLPrivateKey
    # The unique identifier for the SAML private key.
    property key_id : String | Nil

    # The date and time, in [ISO 8601 date-time ](http://www.iso.org/iso/iso8601) format, when the
    # private key was uploaded.
    property timestamp : Time | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @timestamp : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @key_id
        params << {"#{prefix}KeyId", value}
      end

      if value = @timestamp
        params << {"#{prefix}Timestamp", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='KeyId']")),
        timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='Timestamp']")),
      )
    end

    def validate! : Nil
      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 22") if value.size < 22
        raise Core::ValidationError.new("KeyId length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("KeyId does not match the required pattern") unless value.matches?(Regex.new("^[A-Z0-9]+$"))
      end
    end

    def_equals_and_hash(@key_id, @timestamp)
  end
end
