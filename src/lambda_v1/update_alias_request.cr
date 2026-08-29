module Amazonite::LambdaV1
  class UpdateAliasRequest
    include JSON::Serializable

    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    @[JSON::Field(key: "Name", ignore: true)]
    property name : String = ""

    @[JSON::Field(key: "FunctionVersion")]
    property function_version : String | Nil

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "RoutingConfig")]
    property routing_config : AliasRoutingConfiguration | Nil

    @[JSON::Field(key: "RevisionId")]
    property revision_id : String | Nil

    def initialize(
      @function_name : String,
      @name : String,
      @function_version : String | Nil = nil,
      @description : String | Nil = nil,
      @routing_config : AliasRoutingConfiguration | Nil = nil,
      @revision_id : String | Nil = nil,
    )
    end
  end
end
