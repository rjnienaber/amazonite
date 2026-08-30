module Amazonite::LambdaV1
  class UpdateAliasRequest
    include JSON::Serializable

    # The name or ARN of the Lambda function.
    #
    # **Name formats**
    #
    # - **Function name** - `MyFunction`.
    #
    # - **Function ARN** - `arn:aws:lambda:us-west-2:123456789012:function:MyFunction`.
    #
    # - **Partial ARN** - `123456789012:function:MyFunction`.
    #
    # The length constraint applies only to the full ARN. If you specify only the function name, it is
    # limited to 64 characters in length.
    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    # The name of the alias.
    @[JSON::Field(key: "Name", ignore: true)]
    property name : String = ""

    # The function version that the alias invokes.
    @[JSON::Field(key: "FunctionVersion")]
    property function_version : String | Nil

    # A description of the alias.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The [routing
    # configuration](https://docs.aws.amazon.com/lambda/latest/dg/configuration-aliases.html#configuring-alias-routing)
    # of the alias.
    @[JSON::Field(key: "RoutingConfig")]
    property routing_config : AliasRoutingConfiguration | Nil

    # Only update the alias if the revision ID matches the ID that's specified. Use this option to
    # avoid modifying an alias that has changed since you last read it.
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

    def_equals_and_hash(@function_name, @name, @function_version, @description, @routing_config, @revision_id)
  end
end
