module Amazonite::LambdaV1
  class CreateAliasRequest
    include JSON::Serializable

    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "FunctionVersion")]
    property function_version : String

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "RoutingConfig")]
    property routing_config : AliasRoutingConfiguration | Nil

    def initialize(
      @function_name : String,
      @name : String,
      @function_version : String,
      @description : String | Nil = nil,
      @routing_config : AliasRoutingConfiguration | Nil = nil,
    )
    end
  end
end
