private alias ASM = Amazonite::SecretsManager
private alias Core = Amazonite::Core

module Amazonite::SecretsManager
  # A replication object consisting of a `RegionReplicationStatus` object and includes a Region,
  # KMSKeyId, status, and status message.
  class ReplicationStatusType
    include JSON::Serializable

    # The Region where replication occurs.
    @[JSON::Field(key: "Region")]
    property region : String | Nil

    # Can be an `ARN`, `Key ID`, or `Alias`.
    @[JSON::Field(key: "KmsKeyId")]
    property kms_key_id : String | Nil

    # The status can be `InProgress`, `Failed`, or `InSync`.
    @[JSON::Field(key: "Status", converter: ASM::StatusType)]
    property status : StatusType | Nil

    # Status message such as "*Secret with this name already exists in this region*".
    @[JSON::Field(key: "StatusMessage")]
    property status_message : String | Nil

    # The date that the secret was last accessed in the Region. This field is omitted if the secret
    # has never been retrieved in the Region.
    @[JSON::Field(key: "LastAccessedDate", converter: Core::AWSEpochConverter)]
    property last_accessed_date : Time | Nil

    def initialize(
      @region : String | Nil = nil,
      @kms_key_id : String | Nil = nil,
      @status : StatusType | Nil = nil,
      @status_message : String | Nil = nil,
      @last_accessed_date : Time | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @region
        raise Core::ValidationError.new("Region length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Region length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("Region does not match the required pattern") unless value.matches?(Regex.new("^([a-z]+-)+\\d+$"))
      end

      if value = @kms_key_id
        raise Core::ValidationError.new("KmsKeyId length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("KmsKeyId length must be <= 2048") if value.size > 2048
      end

      if value = @status_message
        raise Core::ValidationError.new("StatusMessage length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StatusMessage length must be <= 4096") if value.size > 4096
      end
    end

    def_equals_and_hash(@region, @kms_key_id, @status, @status_message, @last_accessed_date)
  end
end
