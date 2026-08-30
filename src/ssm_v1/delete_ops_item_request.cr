private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class DeleteOpsItemRequest
    include JSON::Serializable

    # The ID of the OpsItem that you want to delete.
    @[JSON::Field(key: "OpsItemId")]
    property ops_item_id : String

    def initialize(
      @ops_item_id : String,
    )
    end

    def validate! : Nil
      if value = @ops_item_id
        raise Core::ValidationError.new("OpsItemId does not match the required pattern") unless value.matches?(Regex.new("^(oi)-[0-9a-f]{12}$"))
      end
    end

    def_equals_and_hash(@ops_item_id)
  end
end
