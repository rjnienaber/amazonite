private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @ops_item_id
        raise Core::ValidationError.new("OpsItemId does not match the required pattern") unless value.matches?(Regex.new("^(oi)-[0-9a-f]{12}$"))
      end

      if value = @ops_item_arn
        raise Core::ValidationError.new("OpsItemArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("OpsItemArn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("OpsItemArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*)?:ssm:[a-z0-9-\\.]{0,63}:[0-9]{12}:opsitem"))
      end
    end

    def_equals_and_hash(@ops_item_id, @ops_item_arn)
  end
end
