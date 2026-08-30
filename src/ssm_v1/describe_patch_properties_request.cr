private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class DescribePatchPropertiesRequest
    include JSON::Serializable

    # The operating system type for which to list patches.
    @[JSON::Field(key: "OperatingSystem", converter: AS::OperatingSystem)]
    property operating_system : OperatingSystem

    # The patch property for which you want to view patch details.
    @[JSON::Field(key: "Property", converter: AS::PatchProperty)]
    property property : PatchProperty

    # Indicates whether to list patches for the Windows operating system or for applications released
    # by Microsoft. Not applicable for the Linux or macOS operating systems.
    @[JSON::Field(key: "PatchSet", converter: AS::PatchSet)]
    property patch_set : PatchSet | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @operating_system : OperatingSystem,
      @property : PatchProperty,
      @patch_set : PatchSet | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@operating_system, @property, @patch_set, @max_results, @next_token)
  end
end
