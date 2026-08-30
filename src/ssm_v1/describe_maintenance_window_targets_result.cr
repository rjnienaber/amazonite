module Amazonite::SsmV1
  class DescribeMaintenanceWindowTargetsResult
    include JSON::Serializable

    # Information about the targets in the maintenance window.
    @[JSON::Field(key: "Targets")]
    property targets : Array(MaintenanceWindowTarget) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @targets : Array(MaintenanceWindowTarget) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@targets, @next_token)
  end
end
