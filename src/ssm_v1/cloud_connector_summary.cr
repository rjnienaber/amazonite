private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class CloudConnectorSummary
    include JSON::Serializable

    @[JSON::Field(key: "CloudConnectorId")]
    property cloud_connector_id : String | Nil

    @[JSON::Field(key: "DisplayName")]
    property display_name : String | Nil

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "RoleArn")]
    property role_arn : String | Nil

    @[JSON::Field(key: "CreatedAt", converter: Core::AWSEpochConverter)]
    property created_at : Time | Nil

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
