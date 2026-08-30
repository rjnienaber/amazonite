private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @alias_arn
        raise Core::ValidationError.new("AliasArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("AliasArn length must be <= 10000") if value.size > 10000
        raise Core::ValidationError.new("AliasArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:function:[a-zA-Z0-9-_]+(:(\\$LATEST|[a-zA-Z0-9-_]+))?$"))
      end

      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^(?!^[0-9]+$)([a-zA-Z0-9-_]+)$"))
      end

      if value = @function_version
        raise Core::ValidationError.new("FunctionVersion length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("FunctionVersion length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("FunctionVersion does not match the required pattern") unless value.matches?(Regex.new("^(\\$LATEST|[0-9]+)$"))
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 256") if value.size > 256
      end

      if value = @routing_config
        value.validate!
      end
    end

    def_equals_and_hash(@alias_arn, @name, @function_version, @description, @routing_config, @revision_id)
  end
end
