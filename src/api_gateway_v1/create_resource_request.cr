module Amazonite::ApiGatewayV1
  # Requests API Gateway to create a Resource resource.
  class CreateResourceRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The parent resource's identifier.
    @[JSON::Field(key: "parentId", ignore: true)]
    property parent_id : String = ""

    # The last path segment for this resource.
    @[JSON::Field(key: "pathPart")]
    property path_part : String

    def initialize(
      @rest_api_id : String,
      @parent_id : String,
      @path_part : String,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@rest_api_id, @parent_id, @path_part)
  end
end
