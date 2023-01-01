module Amazonite::SsmV1
  class GetOpsItemRequest
    include JSON::Serializable

    @[JSON::Field(key: "OpsItemId")]
    property ops_item_id : String

    def initialize(
      @ops_item_id : String
    )
    end
  end
end
