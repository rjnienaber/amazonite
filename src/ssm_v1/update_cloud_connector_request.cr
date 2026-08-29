module Amazonite::SsmV1
  class UpdateCloudConnectorRequest
    include JSON::Serializable

    # The ID of the cloud connector to update.
    @[JSON::Field(key: "CloudConnectorId")]
    property cloud_connector_id : String

    # A new friendly name for the cloud connector.
    @[JSON::Field(key: "DisplayName")]
    property display_name : String | Nil

    # The updated configuration details for connecting to the third-party cloud environment.
    @[JSON::Field(key: "Configuration")]
    property configuration : CloudConnectorConfiguration | Nil

    # A new description for the cloud connector.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    def initialize(
      @cloud_connector_id : String,
      @display_name : String | Nil = nil,
      @configuration : CloudConnectorConfiguration | Nil = nil,
      @description : String | Nil = nil,
    )
    end
  end
end
