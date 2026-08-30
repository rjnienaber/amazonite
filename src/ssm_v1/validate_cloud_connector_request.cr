private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class ValidateCloudConnectorRequest
    include JSON::Serializable

    # The ID of the cloud connector to validate.
    @[JSON::Field(key: "CloudConnectorId")]
    property cloud_connector_id : String

    # The maximum number of validation findings to return.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @cloud_connector_id : String,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @cloud_connector_id
        raise Core::ValidationError.new("CloudConnectorId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("CloudConnectorId length must be <= 36") if value.size > 36
        raise Core::ValidationError.new("CloudConnectorId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$"))
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 0") if value < 0
        raise Core::ValidationError.new("MaxResults value must be <= 75") if value > 75
      end
    end

    def_equals_and_hash(@cloud_connector_id, @max_results, @next_token)
  end
end
