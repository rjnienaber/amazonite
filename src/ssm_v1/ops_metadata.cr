private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Operational metadata for an application in Application Manager.
  class OpsMetadata
    include JSON::Serializable

    # The ID of the Application Manager application.
    @[JSON::Field(key: "ResourceId")]
    property resource_id : String | Nil

    # The Amazon Resource Name (ARN) of the OpsMetadata Object or blob.
    @[JSON::Field(key: "OpsMetadataArn")]
    property ops_metadata_arn : String | Nil

    # The date the OpsMetadata object was last updated.
    @[JSON::Field(key: "LastModifiedDate", converter: Core::AWSEpochConverter)]
    property last_modified_date : Time | Nil

    # The user name who last updated the OpsMetadata object.
    @[JSON::Field(key: "LastModifiedUser")]
    property last_modified_user : String | Nil

    # The date the OpsMetadata objects was created.
    @[JSON::Field(key: "CreationDate", converter: Core::AWSEpochConverter)]
    property creation_date : Time | Nil

    def initialize(
      @resource_id : String | Nil = nil,
      @ops_metadata_arn : String | Nil = nil,
      @last_modified_date : Time | Nil = nil,
      @last_modified_user : String | Nil = nil,
      @creation_date : Time | Nil = nil,
    )
    end

    def_equals_and_hash(@resource_id, @ops_metadata_arn, @last_modified_date, @last_modified_user, @creation_date)
  end
end
