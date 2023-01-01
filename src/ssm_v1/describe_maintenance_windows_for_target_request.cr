private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class DescribeMaintenanceWindowsForTargetRequest
    include JSON::Serializable

    @[JSON::Field(key: "Targets")]
    property targets : Array(Target)

    @[JSON::Field(key: "ResourceType", converter: AS::MaintenanceWindowResourceType)]
    property resource_type : MaintenanceWindowResourceType

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @targets : Array(Target),
      @resource_type : MaintenanceWindowResourceType,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
