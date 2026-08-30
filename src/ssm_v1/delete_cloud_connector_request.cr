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

    def_equals_and_hash(@cloud_connector_id)
  end
end
