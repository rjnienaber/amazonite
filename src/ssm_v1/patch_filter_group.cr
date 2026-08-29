module Amazonite::SsmV1
  # A set of patch filters, typically used for approval rules.
  class PatchFilterGroup
    include JSON::Serializable

    # The set of patch filters that make up the group.
    @[JSON::Field(key: "PatchFilters")]
    property patch_filters : Array(PatchFilter) = [] of PatchFilter

    def initialize(
      @patch_filters : Array(PatchFilter),
    )
    end
  end
end
