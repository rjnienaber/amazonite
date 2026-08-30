module Amazonite::ApiGatewayV1
  # A request to generate a ClientCertificate resource.
  class GenerateClientCertificateRequest
    include JSON::Serializable

    # The description of the ClientCertificate.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    # The key-value map of strings. The valid character set is [a-zA-Z+-=._:/]. The tag key can be up
    # to 128 characters and must not start with `aws:`. The tag value can be up to 256 characters.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @description : String | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@description, @tags)
  end
end
