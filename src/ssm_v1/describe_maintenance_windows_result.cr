private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class DescribeMaintenanceWindowsResult
    include JSON::Serializable

    # Information about the maintenance windows.
    @[JSON::Field(key: "WindowIdentities")]
    property window_identities : Array(MaintenanceWindowIdentity) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @window_identities : Array(MaintenanceWindowIdentity) | Nil = nil,
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
