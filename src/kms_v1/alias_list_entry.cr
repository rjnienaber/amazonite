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

    def validate! : Nil
      if value = @alias_name
        raise Core::ValidationError.new("AliasName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AliasName length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("AliasName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9:/_-]+$"))
      end

      if value = @alias_arn
        raise Core::ValidationError.new("AliasArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("AliasArn length must be <= 2048") if value.size > 2048
      end

      if value = @target_key_id
        raise Core::ValidationError.new("TargetKeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TargetKeyId length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@alias_name, @alias_arn, @target_key_id, @creation_date, @last_updated_date)
  end
end
