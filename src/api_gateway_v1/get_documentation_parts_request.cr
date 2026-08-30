private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  # Gets the documentation parts of an API. The result may be filtered by the type, name, or path of
  # API entities (targets).
  class GetDocumentationPartsRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The type of API entities of the to-be-retrieved documentation parts.
    @[JSON::Field(key: "type", converter: AAG::DocumentationPartType, ignore: true)]
    property type : DocumentationPartType | Nil

    # The name of API entities of the to-be-retrieved documentation parts.
    @[JSON::Field(key: "nameQuery", ignore: true)]
    property name_query : String | Nil

    # The path of API entities of the to-be-retrieved documentation parts.
    @[JSON::Field(key: "path", ignore: true)]
    property path : String | Nil

    # The current pagination position in the paged result set.
    @[JSON::Field(key: "position", ignore: true)]
    property position : String | Nil

    # The maximum number of returned results per page. The default value is 25 and the maximum value
    # is 500.
    @[JSON::Field(key: "limit", ignore: true)]
    property limit : Int32 | Nil

    # The status of the API documentation parts to retrieve. Valid values are `DOCUMENTED` for
    # retrieving DocumentationPart resources with content and `UNDOCUMENTED` for DocumentationPart
    # resources without content.
    @[JSON::Field(key: "locationStatus", converter: AAG::LocationStatusType, ignore: true)]
    property location_status : LocationStatusType | Nil

    def initialize(
      @rest_api_id : String,
      @type : DocumentationPartType | Nil = nil,
      @name_query : String | Nil = nil,
      @path : String | Nil = nil,
      @position : String | Nil = nil,
      @limit : Int32 | Nil = nil,
      @location_status : LocationStatusType | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@rest_api_id, @type, @name_query, @path, @position, @limit, @location_status)
  end
end
