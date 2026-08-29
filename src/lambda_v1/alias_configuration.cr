module Amazonite::LambdaV1
  class AliasConfiguration
    include JSON::Serializable

    @[JSON::Field(key: "AliasArn")]
    property alias_arn : String | Nil

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "FunctionVersion")]
    property function_version : String | Nil

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "RoutingConfig")]
    property routing_config : AliasRoutingConfiguration | Nil

    @[JSON::Field(key: "RevisionId")]
    property revision_id : String | Nil

    def initialize(
      @alias_arn : String | Nil = nil,
      @name : String | Nil = nil,
      @function_version : String | Nil = nil,
      @description : String | Nil = nil,
      @routing_config : AliasRoutingConfiguration | Nil = nil,
      @revision_id : String | Nil = nil,
    )
    end
  end
end
