module Amazonite::SsmV1
  class DescribePatchGroupStateRequest
    include JSON::Serializable

    @[JSON::Field(key: "PatchGroup")]
    property patch_group : String

    def initialize(
      @patch_group : String
    )
    end
  end
end
