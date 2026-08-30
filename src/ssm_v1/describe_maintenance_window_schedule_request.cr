private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class DescribeMaintenanceWindowScheduleRequest
    include JSON::Serializable

    # The ID of the maintenance window to retrieve information about.
    @[JSON::Field(key: "WindowId")]
    property window_id : String | Nil

    # The managed node ID or key-value pair to retrieve information about.
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    # The type of resource you want to retrieve information about. For example, `INSTANCE`.
    @[JSON::Field(key: "ResourceType", converter: AS::MaintenanceWindowResourceType)]
    property resource_type : MaintenanceWindowResourceType | Nil

    # Filters used to limit the range of results. For example, you can limit maintenance window
    # executions to only those scheduled before or after a certain date and time.
    @[JSON::Field(key: "Filters")]
    property filters : Array(PatchOrchestratorFilter) | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @window_id : String | Nil = nil,
      @targets : Array(Target) | Nil = nil,
      @resource_type : MaintenanceWindowResourceType | Nil = nil,
      @filters : Array(PatchOrchestratorFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @window_id
        raise Core::ValidationError.new("WindowId length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("WindowId length must be <= 20") if value.size > 20
        raise Core::ValidationError.new("WindowId does not match the required pattern") unless value.matches?(Regex.new("^mw-[0-9a-f]{17}$"))
      end

      if value = @targets
        raise Core::ValidationError.new("Targets must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Targets must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end

      if value = @filters
        raise Core::ValidationError.new("Filters must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Filters must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
      end
    end

    def_equals_and_hash(@window_id, @targets, @resource_type, @filters, @max_results, @next_token)
  end
end
