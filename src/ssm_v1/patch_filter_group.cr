module Amazonite::SsmV1
  class PatchFilterGroup
    include JSON::Serializable

    @[JSON::Field(key: "PatchFilters")]
    property patch_filters : Array(PatchFilter)

    def initialize(
      @patch_filters : Array(PatchFilter)
    )
    end
  end
end
