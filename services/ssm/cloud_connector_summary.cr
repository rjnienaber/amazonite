private alias Core = Amazonite::Core

module Amazonite::Ssm
  # Summary information about a cloud connector.
  class CloudConnectorSummary
    include JSON::Serializable

    # The ID of the cloud connector.
    @[JSON::Field(key: "CloudConnectorId")]
    property cloud_connector_id : String | Nil

    # The friendly name of the cloud connector.
    @[JSON::Field(key: "DisplayName")]
    property display_name : String | Nil

    # The description of the cloud connector.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The ARN of the IAM role used by the cloud connector.
    @[JSON::Field(key: "RoleArn")]
    property role_arn : String | Nil

    # The date and time the cloud connector was created.
    @[JSON::Field(key: "CreatedAt", converter: Core::AWSEpochConverter)]
    property created_at : Time | Nil

    # The date and time the cloud connector was last updated.
    @[JSON::Field(key: "UpdatedAt", converter: Core::AWSEpochConverter)]
    property updated_at : Time | Nil

    def initialize(
      @cloud_connector_id : String | Nil = nil,
      @display_name : String | Nil = nil,
      @description : String | Nil = nil,
      @role_arn : String | Nil = nil,
      @created_at : Time | Nil = nil,
      @updated_at : Time | Nil = nil,
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

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("Description does not match the required pattern") unless value.matches?(Regex.new("^([\\p{L}\\p{Z}\\p{N}\\p{P}\\p{M}]*)$"))
      end

      if value = @role_arn
        raise Core::ValidationError.new("RoleArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("RoleArn length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@cloud_connector_id, @display_name, @description, @role_arn, @created_at, @updated_at)
  end
end
