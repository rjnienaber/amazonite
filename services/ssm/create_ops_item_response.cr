private alias Core = Amazonite::Core

module Amazonite::Ssm
  class CreateOpsItemResponse
    include JSON::Serializable

    # The ID of the OpsItem.
    @[JSON::Field(key: "OpsItemId")]
    property ops_item_id : String | Nil

    # The OpsItem Amazon Resource Name (ARN).
    @[JSON::Field(key: "OpsItemArn")]
    property ops_item_arn : String | Nil

    def initialize(
      @ops_item_id : String | Nil = nil,
      @ops_item_arn : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @ops_item_arn
        raise Core::ValidationError.new("OpsItemArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("OpsItemArn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("OpsItemArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*)?:ssm:[a-z0-9-\\.]{0,63}:[0-9]{12}:opsitem"))
      end
    end

    def_equals_and_hash(@ops_item_id, @ops_item_arn)
  end
end
