module Amazonite::ApiGateway
  # A reference to a unique stage identified in the format `{restApiId}/{stage}`.
  class StageKey
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId")]
    property rest_api_id : String | Nil

    # The stage name associated with the stage key.
    @[JSON::Field(key: "stageName")]
    property stage_name : String | Nil

    def initialize(
      @rest_api_id : String | Nil = nil,
      @stage_name : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@rest_api_id, @stage_name)
  end
end
