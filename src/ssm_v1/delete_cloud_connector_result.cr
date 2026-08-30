private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class DeleteCloudConnectorResult
    include JSON::Serializable

    # The ID of the cloud connector that was deleted.
    @[JSON::Field(key: "CloudConnectorId")]
    property cloud_connector_id : String | Nil

    def initialize(
      @cloud_connector_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @cloud_connector_id
        raise Core::ValidationError.new("CloudConnectorId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("CloudConnectorId length must be <= 36") if value.size > 36
        raise Core::ValidationError.new("CloudConnectorId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$"))
      end
    end

    def_equals_and_hash(@cloud_connector_id)
  end
end
