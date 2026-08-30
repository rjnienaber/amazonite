module Amazonite::LambdaV1
  # Provides configuration information about a Lambda function
  # [alias](https://docs.aws.amazon.com/lambda/latest/dg/configuration-aliases.html).
  class AliasConfiguration
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the alias.
    @[JSON::Field(key: "AliasArn")]
    property alias_arn : String | Nil

    # The name of the alias.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The function version that the alias invokes.
    @[JSON::Field(key: "FunctionVersion")]
    property function_version : String | Nil

    # A description of the alias.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The [routing
    # configuration](https://docs.aws.amazon.com/lambda/latest/dg/lambda-traffic-shifting-using-aliases.html)
    # of the alias.
    @[JSON::Field(key: "RoutingConfig")]
    property routing_config : AliasRoutingConfiguration | Nil

    # A unique identifier that changes when you update the alias.
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

    def_equals_and_hash(@alias_arn, @name, @function_version, @description, @routing_config, @revision_id)
  end
end
