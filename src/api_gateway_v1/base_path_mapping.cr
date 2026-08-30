module Amazonite::ApiGatewayV1
  # Represents the base path that callers of the API must provide as part of the URL after the
  # domain name.
  class BasePathMapping
    include JSON::Serializable

    # The base path name that callers of the API must provide as part of the URL after the domain
    # name.
    @[JSON::Field(key: "basePath")]
    property base_path : String | Nil

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId")]
    property rest_api_id : String | Nil

    # The name of the associated stage.
    @[JSON::Field(key: "stage")]
    property stage : String | Nil

    def initialize(
      @base_path : String | Nil = nil,
      @rest_api_id : String | Nil = nil,
      @stage : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@base_path, @rest_api_id, @stage)
  end
end
