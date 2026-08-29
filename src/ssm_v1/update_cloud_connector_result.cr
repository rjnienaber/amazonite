module Amazonite::SsmV1
  class UpdateCloudConnectorResult
    include JSON::Serializable

    @[JSON::Field(key: "CloudConnectorId")]
    property cloud_connector_id : String | Nil

    def initialize(
      @cloud_connector_id : String | Nil = nil,
    )
    end
  end
end
