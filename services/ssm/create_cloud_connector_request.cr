private alias Core = Amazonite::Core

module Amazonite::Ssm
  class CreateCloudConnectorRequest
    include JSON::Serializable

    # A friendly name for the cloud connector.
    @[JSON::Field(key: "DisplayName")]
    property display_name : String

    # The Amazon Resource Name (ARN) of the IAM role that the cloud connector uses to communicate with
    # the third-party cloud environment.
    @[JSON::Field(key: "RoleArn")]
    property role_arn : String

    # A description for the cloud connector.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The configuration details for connecting to the third-party cloud environment.
    @[JSON::Field(key: "Configuration")]
    property configuration : CloudConnectorConfiguration

    # The ARN of the Amazon Web Services Config connector associated with this cloud connector.
    @[JSON::Field(key: "ConfigConnectorArn")]
    property config_connector_arn : String

    # Optional metadata that you assign to a resource. Tags enable you to categorize a resource in
    # different ways, such as by purpose, owner, or environment.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    def initialize(
      @display_name : String,
      @role_arn : String,
      @configuration : CloudConnectorConfiguration,
      @config_connector_arn : String,
      @description : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @display_name
        raise Core::ValidationError.new("DisplayName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("DisplayName length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("DisplayName does not match the required pattern") unless value.matches?(Regex.new("^([\\p{L}\\p{Z}\\p{N}\\p{P}\\p{M}]*)$"))
      end

      if value = @role_arn
        raise Core::ValidationError.new("RoleArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("RoleArn length must be <= 2048") if value.size > 2048
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("Description does not match the required pattern") unless value.matches?(Regex.new("^([\\p{L}\\p{Z}\\p{N}\\p{P}\\p{M}]*)$"))
      end

      if value = @configuration
        value.validate!
      end

      if value = @config_connector_arn
        raise Core::ValidationError.new("ConfigConnectorArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ConfigConnectorArn length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("ConfigConnectorArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws(-cn|-us-gov)?:config:([^:]+):\\d{12}:connector/.+$"))
      end

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Tags must have at most 1000 item(s)") if value.size > 1000
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@display_name, @role_arn, @description, @configuration, @config_connector_arn, @tags)
  end
end
