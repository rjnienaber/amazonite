module Amazonite::SsmV1
  class DescribeMaintenanceWindowsForTargetResult
    include JSON::Serializable

    @[JSON::Field(key: "WindowIdentities")]
    property window_identities : Array(MaintenanceWindowIdentityForTarget) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @window_identities : Array(MaintenanceWindowIdentityForTarget) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
