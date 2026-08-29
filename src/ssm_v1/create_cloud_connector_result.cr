module Amazonite::SsmV1
  class CreateCloudConnectorResult
    include JSON::Serializable

    # The ID of the cloud connector that was created.
    @[JSON::Field(key: "CloudConnectorId")]
    property cloud_connector_id : String | Nil

    def initialize(
      @cloud_connector_id : String | Nil = nil,
    )
    end
  end
end
