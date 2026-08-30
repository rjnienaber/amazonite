module Amazonite::SsmV1
  class DescribeInstancePatchesResult
    include JSON::Serializable

    # Each entry in the array is a structure containing:
    #
    # - Title (string)
    #
    # - KBId (string)
    #
    # - Classification (string)
    #
    # - Severity (string)
    #
    # - State (string, such as "INSTALLED" or "FAILED")
    #
    # - InstalledTime (DateTime)
    #
    # - InstalledBy (string)
    @[JSON::Field(key: "Patches")]
    property patches : Array(PatchComplianceData) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @patches : Array(PatchComplianceData) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
