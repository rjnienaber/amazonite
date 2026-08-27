module Amazonite::SsmV1
  class CreateOpsItemResponse
    include JSON::Serializable

    @[JSON::Field(key: "OpsItemId")]
    property ops_item_id : String | Nil

    @[JSON::Field(key: "OpsItemArn")]
    property ops_item_arn : String | Nil

    def initialize(
      @ops_item_id : String | Nil = nil,
      @ops_item_arn : String | Nil = nil,
    )
    end
  end
end
