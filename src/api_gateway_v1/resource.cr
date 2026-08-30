module Amazonite::ApiGatewayV1
  # Represents an API resource.
  class Resource
    include JSON::Serializable

    # The resource's identifier.
    @[JSON::Field(key: "id")]
    property id : String | Nil

    # The parent resource's identifier.
    @[JSON::Field(key: "parentId")]
    property parent_id : String | Nil

    # The last path segment for this resource.
    @[JSON::Field(key: "pathPart")]
    property path_part : String | Nil

    # The full path for this resource.
    @[JSON::Field(key: "path")]
    property path : String | Nil

    # Gets an API resource's method of a given HTTP verb.
    @[JSON::Field(key: "resourceMethods")]
    property resource_methods : Hash(String, Method) | Nil

    def initialize(
      @id : String | Nil = nil,
      @parent_id : String | Nil = nil,
      @path_part : String | Nil = nil,
      @path : String | Nil = nil,
      @resource_methods : Hash(String, Method) | Nil = nil,
    )
    end

    def_equals_and_hash(@id, @parent_id, @path_part, @path, @resource_methods)
  end
end
