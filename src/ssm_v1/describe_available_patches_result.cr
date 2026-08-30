private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class DescribeAvailablePatchesResult
    include JSON::Serializable

    # An array of patches. Each entry in the array is a patch structure.
    @[JSON::Field(key: "Patches")]
    property patches : Array(Patch) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @patches : Array(Patch) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @patches
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@patches, @next_token)
  end
end
