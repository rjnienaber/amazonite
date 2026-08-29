module Amazonite::SsmV1
  class GetOpsItemResponse
    include JSON::Serializable

    # The OpsItem.
    @[JSON::Field(key: "OpsItem")]
    property ops_item : OpsItem | Nil

    def initialize(
      @ops_item : OpsItem | Nil = nil,
    )
    end
  end
end
