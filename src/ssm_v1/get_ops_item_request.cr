module Amazonite::SsmV1
  class GetOpsItemRequest
    include JSON::Serializable

    @[JSON::Field(key: "OpsItemId")]
    property ops_item_id : String

    @[JSON::Field(key: "OpsItemArn")]
    property ops_item_arn : String | Nil

    def initialize(
      @ops_item_id : String,
      @ops_item_arn : String | Nil = nil,
    )
    end
  end
end
