module Amazonite::ApiGateway
  # Request to list information about a model in an existing RestApi resource.
  class GetModelRequest
    include JSON::Serializable

    # The RestApi identifier under which the Model exists.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The name of the model as an identifier.
    @[JSON::Field(key: "modelName", ignore: true)]
    property model_name : String = ""

    # A query parameter of a Boolean value to resolve (`true`) all external model references and
    # returns a flattened model schema or not (`false`) The default is `false`.
    @[JSON::Field(key: "flatten", ignore: true)]
    property flatten : Bool | Nil

    def initialize(
      @rest_api_id : String,
      @model_name : String,
      @flatten : Bool | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@rest_api_id, @model_name, @flatten)
  end
end
