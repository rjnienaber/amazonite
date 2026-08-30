module Amazonite::SsmV1
  class UpdateCloudConnectorResult
    include JSON::Serializable

    # The ID of the cloud connector that was updated.
    @[JSON::Field(key: "CloudConnectorId")]
    property cloud_connector_id : String | Nil

    def initialize(
      @cloud_connector_id : String | Nil = nil,
    )
    end

    def_equals_and_hash(@cloud_connector_id)
  end
end
