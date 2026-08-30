private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class GetCloudConnectorResult
    include JSON::Serializable

    # The ARN of the cloud connector.
    @[JSON::Field(key: "CloudConnectorArn")]
    property cloud_connector_arn : String | Nil

    # The friendly name of the cloud connector.
    @[JSON::Field(key: "DisplayName")]
    property display_name : String | Nil

    # The description of the cloud connector.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The ARN of the IAM role used by the cloud connector.
    @[JSON::Field(key: "RoleArn")]
    property role_arn : String | Nil

    # The configuration details for the third-party cloud environment connection.
    @[JSON::Field(key: "Configuration")]
    property configuration : CloudConnectorConfiguration | Nil

    # The ARN of the Amazon Web Services Config connector associated with this cloud connector.
    @[JSON::Field(key: "ConfigConnectorArn")]
    property config_connector_arn : String | Nil

    # The date and time the cloud connector was created.
    @[JSON::Field(key: "CreatedAt", converter: Core::AWSEpochConverter)]
    property created_at : Time | Nil

    # The date and time the cloud connector was last updated.
    @[JSON::Field(key: "UpdatedAt", converter: Core::AWSEpochConverter)]
    property updated_at : Time | Nil

    def initialize(
      @cloud_connector_arn : String | Nil = nil,
      @display_name : String | Nil = nil,
      @description : String | Nil = nil,
      @role_arn : String | Nil = nil,
      @configuration : CloudConnectorConfiguration | Nil = nil,
      @config_connector_arn : String | Nil = nil,
      @created_at : Time | Nil = nil,
      @updated_at : Time | Nil = nil,
    )
    end

    def_equals_and_hash(@cloud_connector_arn, @display_name, @description, @role_arn, @configuration, @config_connector_arn, @created_at, @updated_at)
  end
end
