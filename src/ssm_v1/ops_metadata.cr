private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class OpsMetadata
    include JSON::Serializable

    @[JSON::Field(key: "ResourceId")]
    property resource_id : String | Nil

    @[JSON::Field(key: "OpsMetadataArn")]
    property ops_metadata_arn : String | Nil

    @[JSON::Field(key: "LastModifiedDate", converter: Core::AWSEpochConverter)]
    property last_modified_date : Time | Nil

    @[JSON::Field(key: "LastModifiedUser")]
    property last_modified_user : String | Nil

    @[JSON::Field(key: "CreationDate", converter: Core::AWSEpochConverter)]
    property creation_date : Time | Nil

    def initialize(
      @resource_id : String | Nil = nil,
      @ops_metadata_arn : String | Nil = nil,
      @last_modified_date : Time | Nil = nil,
      @last_modified_user : String | Nil = nil,
      @creation_date : Time | Nil = nil
    )
    end
  end
end
