private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class GetKeyLastUsageResponse
    include JSON::Serializable

    # The globally unique identifier for the KMS key.
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    # Contains usage information about the last time the KMS key was used for a successful
    # cryptographic operation. If the key has not been used since tracking began, this response
    # element is empty.
    @[JSON::Field(key: "KeyLastUsage")]
    property key_last_usage : KeyLastUsageData | Nil

    # The date from which KMS began recording cryptographic activity for this key, or the date the KMS
    # key was created, whichever is later.
    @[JSON::Field(key: "TrackingStartDate", converter: Core::AWSEpochConverter)]
    property tracking_start_date : Time | Nil

    # The date and time when the KMS key was created.
    @[JSON::Field(key: "KeyCreationDate", converter: Core::AWSEpochConverter)]
    property key_creation_date : Time | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @key_last_usage : KeyLastUsageData | Nil = nil,
      @tracking_start_date : Time | Nil = nil,
      @key_creation_date : Time | Nil = nil,
    )
    end

    def_equals_and_hash(@key_id, @key_last_usage, @tracking_start_date, @key_creation_date)
  end
end
