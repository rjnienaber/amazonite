private alias Core = Amazonite::Core

module Amazonite::KmsV1
  # Contains information about an alias.
  class AliasListEntry
    include JSON::Serializable

    # String that contains the alias. This value begins with `alias/`.
    @[JSON::Field(key: "AliasName")]
    property alias_name : String | Nil

    # String that contains the key ARN.
    @[JSON::Field(key: "AliasArn")]
    property alias_arn : String | Nil

    # String that contains the key identifier of the KMS key associated with the alias.
    @[JSON::Field(key: "TargetKeyId")]
    property target_key_id : String | Nil

    # Date and time that the alias was most recently created in the account and Region. Formatted as
    # Unix time.
    @[JSON::Field(key: "CreationDate", converter: Core::AWSEpochConverter)]
    property creation_date : Time | Nil

    # Date and time that the alias was most recently associated with a KMS key in the account and
    # Region. Formatted as Unix time.
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

    def_equals_and_hash(@alias_name, @alias_arn, @target_key_id, @creation_date, @last_updated_date)
  end
end
