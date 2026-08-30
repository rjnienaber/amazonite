module Amazonite::SsmV1
  # An OpsItems that shares something in common with the current OpsItem. For example, related
  # OpsItems can include OpsItems with similar error messages, impacted resources, or statuses for
  # the impacted resource.
  class RelatedOpsItem
    include JSON::Serializable

    # The ID of an OpsItem related to the current OpsItem.
    @[JSON::Field(key: "OpsItemId")]
    property ops_item_id : String

    def initialize(
      @ops_item_id : String,
    )
    end
  end
end
