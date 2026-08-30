module Amazonite::ApiGatewayV1
  # The binary blob response to GetSdk, which contains the generated SDK.
  class SdkResponse
    include JSON::Serializable

    # The content-type header value in the HTTP response.
    @[JSON::Field(key: "contentType", ignore: true)]
    property content_type : String | Nil

    # The content-disposition header value in the HTTP response.
    @[JSON::Field(key: "contentDisposition", ignore: true)]
    property content_disposition : String | Nil

    # The binary blob response to GetSdk, which contains the generated SDK.
    @[JSON::Field(key: "body")]
    property body : String | Nil

    def initialize(
      @content_type : String | Nil = nil,
      @content_disposition : String | Nil = nil,
      @body : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@content_type, @content_disposition, @body)
  end
end
