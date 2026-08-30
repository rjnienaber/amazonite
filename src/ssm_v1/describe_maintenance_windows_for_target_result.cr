private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class DescribeMaintenanceWindowsForTargetResult
    include JSON::Serializable

    # Information about the maintenance window targets and tasks a managed node is associated with.
    @[JSON::Field(key: "WindowIdentities")]
    property window_identities : Array(MaintenanceWindowIdentityForTarget) | Nil

    # The token for the next set of items to return. (You use this token in the next call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @window_identities : Array(MaintenanceWindowIdentityForTarget) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @window_identities
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@window_identities, @next_token)
  end
end
