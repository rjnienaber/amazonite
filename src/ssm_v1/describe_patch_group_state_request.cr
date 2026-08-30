module Amazonite::SsmV1
  class DescribePatchGroupStateRequest
    include JSON::Serializable

    # The name of the patch group whose patch snapshot should be retrieved.
    @[JSON::Field(key: "PatchGroup")]
    property patch_group : String

    def initialize(
      @patch_group : String,
    )
    end

    def_equals_and_hash(@patch_group)
  end
end
