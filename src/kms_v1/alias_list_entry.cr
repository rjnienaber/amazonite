private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class AliasListEntry
    include JSON::Serializable

    @[JSON::Field(key: "AliasName")]
    property alias_name : String | Nil

    @[JSON::Field(key: "AliasArn")]
    property alias_arn : String | Nil

    @[JSON::Field(key: "TargetKeyId")]
    property target_key_id : String | Nil

    @[JSON::Field(key: "CreationDate", converter: Core::AWSEpochConverter)]
    property creation_date : Time | Nil

    @[JSON::Field(key: "LastUpdatedDate", converter: Core::AWSEpochConverter)]
    property last_updated_date : Time | Nil

    def initialize(
      @alias_name : String | Nil = nil,
      @alias_arn : String | Nil = nil,
      @target_key_id : String | Nil = nil,
      @creation_date : Time | Nil = nil,
      @last_updated_date : Time | Nil = nil,
    )
    end
  end
end
