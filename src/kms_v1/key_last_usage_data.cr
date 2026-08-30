private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  # Contains usage information about the last time the KMS key was used for a successful
  # cryptographic operation.
  class KeyLastUsageData
    include JSON::Serializable

    # The last successful cryptographic operation the KMS key was used for. Absent if the key has not
    # been used since KMS began tracking.
    @[JSON::Field(key: "Operation", converter: AK::KeyLastUsageTrackingOperation)]
    property operation : KeyLastUsageTrackingOperation | Nil

    # The date and time when the KMS key was most recently used for a successful cryptographic
    # operation. Absent if the key has not been used since KMS began tracking.
    @[JSON::Field(key: "Timestamp", converter: Core::AWSEpochConverter)]
    property timestamp : Time | Nil

    # The CloudTrail `eventId` associated with the last successful cryptographic operation. Absent if
    # the key has not been used since KMS began tracking.
    @[JSON::Field(key: "CloudTrailEventId")]
    property cloud_trail_event_id : String | Nil

    # The KMS request ID associated with the last successful cryptographic operation. Absent if the
    # key has not been used since KMS began tracking.
    @[JSON::Field(key: "KmsRequestId")]
    property kms_request_id : String | Nil

    def initialize(
      @operation : KeyLastUsageTrackingOperation | Nil = nil,
      @timestamp : Time | Nil = nil,
      @cloud_trail_event_id : String | Nil = nil,
      @kms_request_id : String | Nil = nil,
    )
    end

    def_equals_and_hash(@operation, @timestamp, @cloud_trail_event_id, @kms_request_id)
  end
end
