module Amazonite::LambdaV1
  class CreateAliasRequest
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
    @[JSON::Field(key: "Name")]
    property name : String

    # The function version that the alias invokes.
    @[JSON::Field(key: "FunctionVersion")]
    property function_version : String

    # A description of the alias.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The [routing
    # configuration](https://docs.aws.amazon.com/lambda/latest/dg/configuration-aliases.html#configuring-alias-routing)
    # of the alias.
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

    def_equals_and_hash(@function_name, @name, @function_version, @description, @routing_config)
  end
end
