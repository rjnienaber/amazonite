module Amazonite::ApiGateway
  # Gets a specified documentation part of a given API.
  class GetDocumentationPartRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "documentationPartId", ignore: true)]
    property documentation_part_id : String = ""

    def initialize(
      @rest_api_id : String,
      @documentation_part_id : String,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@rest_api_id, @documentation_part_id)
  end
end
