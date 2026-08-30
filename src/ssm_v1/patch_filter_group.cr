private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @patch_filters
        raise Core::ValidationError.new("PatchFilters must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("PatchFilters must have at most 4 item(s)") if value.size > 4
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@patch_filters)
  end
end
