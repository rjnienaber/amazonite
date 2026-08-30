private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @cloud_connector_id
        raise Core::ValidationError.new("CloudConnectorId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("CloudConnectorId length must be <= 36") if value.size > 36
        raise Core::ValidationError.new("CloudConnectorId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$"))
      end

      if value = @display_name
        raise Core::ValidationError.new("DisplayName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("DisplayName length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("DisplayName does not match the required pattern") unless value.matches?(Regex.new("^([\\p{L}\\p{Z}\\p{N}\\p{P}\\p{M}]*)$"))
      end

      if value = @configuration
        value.validate!
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("Description does not match the required pattern") unless value.matches?(Regex.new("^([\\p{L}\\p{Z}\\p{N}\\p{P}\\p{M}]*)$"))
      end
    end

    def_equals_and_hash(@cloud_connector_id, @display_name, @configuration, @description)
  end
end
