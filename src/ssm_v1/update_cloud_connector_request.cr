module Amazonite::SsmV1
  class UpdateCloudConnectorRequest
    include JSON::Serializable

    @[JSON::Field(key: "CloudConnectorId")]
    property cloud_connector_id : String

    @[JSON::Field(key: "DisplayName")]
    property display_name : String | Nil

    @[JSON::Field(key: "Configuration")]
    property configuration : CloudConnectorConfiguration | Nil

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
