module Amazonite::ApiGatewayV1
  # The binary blob response to GetExport, which contains the generated SDK.
  class ExportResponse
    include JSON::Serializable

    # The content-type header value in the HTTP response. This will correspond to a valid 'accept'
    # type in the request.
    @[JSON::Field(key: "contentType", ignore: true)]
    property content_type : String | Nil

    # The content-disposition header value in the HTTP response.
    @[JSON::Field(key: "contentDisposition", ignore: true)]
    property content_disposition : String | Nil

    # The binary blob response to GetExport, which contains the export.
    @[JSON::Field(key: "body")]
    property body : String | Nil

    def initialize(
      @content_type : String | Nil = nil,
      @content_disposition : String | Nil = nil,
      @body : String | Nil = nil,
    )
    end
  end
end
