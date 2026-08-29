private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Summary information about a cloud connector.
  class CloudConnectorSummary
    include JSON::Serializable

    # The ID of the cloud connector.
    @[JSON::Field(key: "CloudConnectorId")]
    property cloud_connector_id : String | Nil

    # The friendly name of the cloud connector.
    @[JSON::Field(key: "DisplayName")]
    property display_name : String | Nil

    # The description of the cloud connector.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The ARN of the IAM role used by the cloud connector.
    @[JSON::Field(key: "RoleArn")]
    property role_arn : String | Nil

    # The date and time the cloud connector was created.
    @[JSON::Field(key: "CreatedAt", converter: Core::AWSEpochConverter)]
    property created_at : Time | Nil

    # The date and time the cloud connector was last updated.
    @[JSON::Field(key: "UpdatedAt", converter: Core::AWSEpochConverter)]
    property updated_at : Time | Nil

    def initialize(
      @cloud_connector_id : String | Nil = nil,
      @display_name : String | Nil = nil,
      @description : String | Nil = nil,
      @role_arn : String | Nil = nil,
      @created_at : Time | Nil = nil,
      @updated_at : Time | Nil = nil,
    )
    end
  end
end
