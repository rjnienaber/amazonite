private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class OpsItemRelatedItemSummary
    include JSON::Serializable

    @[JSON::Field(key: "OpsItemId")]
    property ops_item_id : String | Nil

    @[JSON::Field(key: "AssociationId")]
    property association_id : String | Nil

    @[JSON::Field(key: "ResourceType")]
    property resource_type : String | Nil

    @[JSON::Field(key: "AssociationType")]
    property association_type : String | Nil

    @[JSON::Field(key: "ResourceUri")]
    property resource_uri : String | Nil

    @[JSON::Field(key: "CreatedBy")]
    property created_by : OpsItemIdentity | Nil

    @[JSON::Field(key: "CreatedTime", converter: Core::AWSEpochConverter)]
    property created_time : Time | Nil

    @[JSON::Field(key: "LastModifiedBy")]
    property last_modified_by : OpsItemIdentity | Nil

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
      @last_modified_time : Time | Nil = nil
    )
    end
  end
end
