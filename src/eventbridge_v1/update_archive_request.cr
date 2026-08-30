module Amazonite::EventBridgeV1
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

    def_equals_and_hash(@archive_name, @description, @event_pattern, @retention_days, @kms_key_identifier)
  end
end
