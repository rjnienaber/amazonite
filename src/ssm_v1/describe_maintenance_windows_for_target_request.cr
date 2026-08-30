private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class DescribeMaintenanceWindowsForTargetRequest
    include JSON::Serializable

    # The managed node ID or key-value pair to retrieve information about.
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) = [] of Target

    # The type of resource you want to retrieve information about. For example, `INSTANCE`.
    @[JSON::Field(key: "ResourceType", converter: AS::MaintenanceWindowResourceType)]
    property resource_type : MaintenanceWindowResourceType

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @targets : Array(Target),
      @resource_type : MaintenanceWindowResourceType,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @targets
        raise Core::ValidationError.new("Targets must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Targets must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
      end
    end

    def_equals_and_hash(@targets, @resource_type, @max_results, @next_token)
  end
end
