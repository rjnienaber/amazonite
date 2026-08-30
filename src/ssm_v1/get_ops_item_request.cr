module Amazonite::SsmV1
  class GetOpsItemRequest
    include JSON::Serializable

    # The ID of the OpsItem that you want to get.
    @[JSON::Field(key: "OpsItemId")]
    property ops_item_id : String

    # The OpsItem Amazon Resource Name (ARN).
    @[JSON::Field(key: "OpsItemArn")]
    property ops_item_arn : String | Nil

    def initialize(
      @ops_item_id : String,
      @ops_item_arn : String | Nil = nil,
    )
    end
  end
end
