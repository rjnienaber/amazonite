module Amazonite::SsmV1
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
  end
end
