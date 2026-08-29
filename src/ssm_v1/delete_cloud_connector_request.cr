module Amazonite::SsmV1
  class DeleteCloudConnectorRequest
    include JSON::Serializable

    @[JSON::Field(key: "CloudConnectorId")]
    property cloud_connector_id : String

    def initialize(
      @cloud_connector_id : String,
    )
    end
  end
end
