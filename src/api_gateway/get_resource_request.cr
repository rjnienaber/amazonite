module Amazonite::ApiGateway
  # Request to list information about a resource.
  class GetResourceRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The identifier for the Resource resource.
    @[JSON::Field(key: "resourceId", ignore: true)]
    property resource_id : String = ""

    # A query parameter to retrieve the specified resources embedded in the returned Resource
    # representation in the response. This `embed` parameter value is a list of comma-separated
    # strings. Currently, the request supports only retrieval of the embedded Method resources this
    # way. The query parameter value must be a single-valued list and contain the `"methods"` string.
    # For example, `GET /restapis/{restapi_id}/resources/{resource_id}?embed=methods`.
    @[JSON::Field(key: "embed", ignore: true)]
    property embed : Array(String) | Nil

    def initialize(
      @rest_api_id : String,
      @resource_id : String,
      @embed : Array(String) | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@rest_api_id, @resource_id, @embed)
  end
end
