module Amazonite::SsmV1
  class DescribeMaintenanceWindowTargetsResult
    include JSON::Serializable

    @[JSON::Field(key: "Targets")]
    property targets : Array(MaintenanceWindowTarget) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @targets : Array(MaintenanceWindowTarget) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
