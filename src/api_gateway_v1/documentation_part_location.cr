private alias AAG = Amazonite::ApiGatewayV1
private alias Core = Amazonite::Core

module Amazonite::ApiGatewayV1
  # Specifies the target API entity to which the documentation applies.
  class DocumentationPartLocation
    include JSON::Serializable

    # The type of API entity to which the documentation content applies. Valid values are `API`,
    # `AUTHORIZER`, `MODEL`, `RESOURCE`, `METHOD`, `PATH_PARAMETER`, `QUERY_PARAMETER`,
    # `REQUEST_HEADER`, `REQUEST_BODY`, `RESPONSE`, `RESPONSE_HEADER`, and `RESPONSE_BODY`. Content
    # inheritance does not apply to any entity of the `API`, `AUTHORIZER`, `METHOD`, `MODEL`,
    # `REQUEST_BODY`, or `RESOURCE` type.
    @[JSON::Field(key: "type", converter: AAG::DocumentationPartType)]
    property type : DocumentationPartType

    # The URL path of the target. It is a valid field for the API entity types of `RESOURCE`,
    # `METHOD`, `PATH_PARAMETER`, `QUERY_PARAMETER`, `REQUEST_HEADER`, `REQUEST_BODY`, `RESPONSE`,
    # `RESPONSE_HEADER`, and `RESPONSE_BODY`. The default value is `/` for the root resource. When an
    # applicable child entity inherits the content of another entity of the same type with more
    # general specifications of the other `location` attributes, the child entity's `path` attribute
    # must match that of the parent entity as a prefix.
    @[JSON::Field(key: "path")]
    property path : String | Nil

    # The HTTP verb of a method. It is a valid field for the API entity types of `METHOD`,
    # `PATH_PARAMETER`, `QUERY_PARAMETER`, `REQUEST_HEADER`, `REQUEST_BODY`, `RESPONSE`,
    # `RESPONSE_HEADER`, and `RESPONSE_BODY`. The default value is `*` for any method. When an
    # applicable child entity inherits the content of an entity of the same type with more general
    # specifications of the other `location` attributes, the child entity's `method` attribute must
    # match that of the parent entity exactly.
    @[JSON::Field(key: "method")]
    property method : String | Nil

    # The HTTP status code of a response. It is a valid field for the API entity types of `RESPONSE`,
    # `RESPONSE_HEADER`, and `RESPONSE_BODY`. The default value is `*` for any status code. When an
    # applicable child entity inherits the content of an entity of the same type with more general
    # specifications of the other `location` attributes, the child entity's `statusCode` attribute
    # must match that of the parent entity exactly.
    @[JSON::Field(key: "statusCode")]
    property status_code : String | Nil

    # The name of the targeted API entity. It is a valid and required field for the API entity types
    # of `AUTHORIZER`, `MODEL`, `PATH_PARAMETER`, `QUERY_PARAMETER`, `REQUEST_HEADER`, `REQUEST_BODY`
    # and `RESPONSE_HEADER`. It is an invalid field for any other entity type.
    @[JSON::Field(key: "name")]
    property name : String | Nil

    def initialize(
      @type : DocumentationPartType,
      @path : String | Nil = nil,
      @method : String | Nil = nil,
      @status_code : String | Nil = nil,
      @name : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @status_code
        raise Core::ValidationError.new("statusCode does not match the required pattern") unless value.matches?(Regex.new("^([1-5]\\d\\d|\\*|\\s*)$"))
      end
    end

    def_equals_and_hash(@type, @path, @method, @status_code, @name)
  end
end
