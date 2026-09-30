module Amazonite::ApiGateway
  # Request to add a new Model to an existing RestApi resource.
  class CreateModelRequest
    include JSON::Serializable

    # The RestApi identifier under which the Model will be created.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The name of the model. Must be alphanumeric.
    @[JSON::Field(key: "name")]
    property name : String

    # The description of the model.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    # The schema for the model. For `application/json` models, this should be JSON schema draft 4
    # model. The maximum size of the model is 400 KB.
    @[JSON::Field(key: "schema")]
    property schema : String | Nil

    # The content-type for the model.
    @[JSON::Field(key: "contentType")]
    property content_type : String

    def initialize(
      @rest_api_id : String,
      @name : String,
      @content_type : String,
      @description : String | Nil = nil,
      @schema : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@rest_api_id, @name, @description, @schema, @content_type)
  end
end
