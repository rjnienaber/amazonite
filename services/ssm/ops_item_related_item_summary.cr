private alias Core = Amazonite::Core

module Amazonite::Ssm
  # Summary information about related-item resources for an OpsItem.
  class OpsItemRelatedItemSummary
    include JSON::Serializable

    # The OpsItem ID.
    @[JSON::Field(key: "OpsItemId")]
    property ops_item_id : String | Nil

    # The association ID.
    @[JSON::Field(key: "AssociationId")]
    property association_id : String | Nil

    # The resource type.
    @[JSON::Field(key: "ResourceType")]
    property resource_type : String | Nil

    # The association type.
    @[JSON::Field(key: "AssociationType")]
    property association_type : String | Nil

    # The Amazon Resource Name (ARN) of the related-item resource.
    @[JSON::Field(key: "ResourceUri")]
    property resource_uri : String | Nil

    @[JSON::Field(key: "CreatedBy")]
    property created_by : OpsItemIdentity | Nil

    # The time the related-item association was created.
    @[JSON::Field(key: "CreatedTime", converter: Core::AWSEpochConverter)]
    property created_time : Time | Nil

    @[JSON::Field(key: "LastModifiedBy")]
    property last_modified_by : OpsItemIdentity | Nil

    # The time the related-item association was last updated.
    @[JSON::Field(key: "LastModifiedTime", converter: Core::AWSEpochConverter)]
    property last_modified_time : Time | Nil

    def initialize(
      @ops_item_id : String | Nil = nil,
      @association_id : String | Nil = nil,
      @resource_type : String | Nil = nil,
      @association_type : String | Nil = nil,
      @resource_uri : String | Nil = nil,
      @created_by : OpsItemIdentity | Nil = nil,
      @created_time : Time | Nil = nil,
      @last_modified_by : OpsItemIdentity | Nil = nil,
      @last_modified_time : Time | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @ops_item_id
        raise Core::ValidationError.new("OpsItemId does not match the required pattern") unless value.matches?(Regex.new("^(oi)-[0-9a-f]{12}$"))
      end

      if value = @created_by
        value.validate!
      end

      if value = @last_modified_by
        value.validate!
      end
    end

    def_equals_and_hash(@ops_item_id, @association_id, @resource_type, @association_type, @resource_uri, @created_by, @created_time, @last_modified_by, @last_modified_time)
  end
end
