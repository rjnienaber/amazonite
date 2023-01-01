module Amazonite::SsmV1
  class CreateOpsItemResponse
    include JSON::Serializable

    @[JSON::Field(key: "OpsItemId")]
    property ops_item_id : String | Nil

    def initialize(
      @ops_item_id : String | Nil = nil
    )
    end
  end
end
