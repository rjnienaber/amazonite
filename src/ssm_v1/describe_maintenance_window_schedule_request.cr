private alias AS = Amazonite::SsmV1

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
  end
end
