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

    def_equals_and_hash(@cloud_connector_id, @max_results, @next_token)
  end
end
