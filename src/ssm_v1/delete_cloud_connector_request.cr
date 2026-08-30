module Amazonite::SsmV1
  class DeleteCloudConnectorRequest
    include JSON::Serializable

    # The ID of the cloud connector to delete.
    @[JSON::Field(key: "CloudConnectorId")]
    property cloud_connector_id : String

    def initialize(
      @cloud_connector_id : String,
    )
    end
  end
end
