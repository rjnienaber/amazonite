module Amazonite::ApiGatewayV1
  # Request to list information about a collection of resources.
  class GetResourcesRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The current pagination position in the paged result set.
    @[JSON::Field(key: "position", ignore: true)]
    property position : String | Nil

    # The maximum number of returned results per page. The default value is 25 and the maximum value
    # is 500.
    @[JSON::Field(key: "limit", ignore: true)]
    property limit : Int32 | Nil

    # A query parameter used to retrieve the specified resources embedded in the returned Resources
    # resource in the response. This `embed` parameter value is a list of comma-separated strings.
    # Currently, the request supports only retrieval of the embedded Method resources this way. The
    # query parameter value must be a single-valued list and contain the `"methods"` string. For
    # example, `GET /restapis/{restapi_id}/resources?embed=methods`.
    @[JSON::Field(key: "embed", ignore: true)]
    property embed : Array(String) | Nil

    def initialize(
      @rest_api_id : String,
      @position : String | Nil = nil,
      @limit : Int32 | Nil = nil,
      @embed : Array(String) | Nil = nil,
    )
    end
  end
end
