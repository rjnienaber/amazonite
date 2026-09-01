private alias Core = Amazonite::Core

module Amazonite::EventBridge
  class UpdateArchiveRequest
    include JSON::Serializable

    # The name of the archive to update.
    @[JSON::Field(key: "ArchiveName")]
    property archive_name : String

    # The description for the archive.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The event pattern to use to filter events sent to the archive.
    @[JSON::Field(key: "EventPattern")]
    property event_pattern : String | Nil

    # The number of days to retain events in the archive.
    @[JSON::Field(key: "RetentionDays")]
    property retention_days : Int32 | Nil

    # The identifier of the KMS customer managed key for EventBridge to use, if you choose to use a
    # customer managed key to encrypt this archive. The identifier can be the key Amazon Resource Name
    # (ARN), KeyId, key alias, or key alias ARN.
    #
    # If you do not specify a customer managed key identifier, EventBridge uses an Amazon Web Services
    # owned key to encrypt the archive.
    #
    # For more information, see [Identify and view
    # keys](https://docs.aws.amazon.com/kms/latest/developerguide/viewing-keys.html) in the *Key
    # Management Service Developer Guide*.
    #
    # If you have specified that EventBridge use a customer managed key for encrypting the source
    # event bus, we strongly recommend you also specify a customer managed key for any archives for
    # the event bus as well.
    #
    # For more information, see [Encrypting
    # archives](https://docs.aws.amazon.com/eventbridge/latest/userguide/encryption-archives.html) in
    # the *Amazon EventBridge User Guide*.
    @[JSON::Field(key: "KmsKeyIdentifier")]
    property kms_key_identifier : String | Nil

    def initialize(
      @archive_name : String,
      @description : String | Nil = nil,
      @event_pattern : String | Nil = nil,
      @retention_days : Int32 | Nil = nil,
      @kms_key_identifier : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @archive_name
        raise Core::ValidationError.new("ArchiveName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ArchiveName length must be <= 48") if value.size > 48
        raise Core::ValidationError.new("ArchiveName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_A-Za-z0-9]+$"))
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("Description does not match the required pattern") unless value.matches?(Regex.new(".*"))
      end

      if value = @event_pattern
        raise Core::ValidationError.new("EventPattern length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("EventPattern length must be <= 4096") if value.size > 4096
      end

      if value = @retention_days
        raise Core::ValidationError.new("RetentionDays value must be >= 0") if value < 0
      end

      if value = @kms_key_identifier
        raise Core::ValidationError.new("KmsKeyIdentifier length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("KmsKeyIdentifier length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("KmsKeyIdentifier does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-/:]*$"))
      end
    end

    def_equals_and_hash(@archive_name, @description, @event_pattern, @retention_days, @kms_key_identifier)
  end
end
