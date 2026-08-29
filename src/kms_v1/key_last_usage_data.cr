private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class KeyLastUsageData
    include JSON::Serializable

    @[JSON::Field(key: "Operation", converter: AK::KeyLastUsageTrackingOperation)]
    property operation : KeyLastUsageTrackingOperation | Nil

    @[JSON::Field(key: "Timestamp", converter: Core::AWSEpochConverter)]
    property timestamp : Time | Nil

    @[JSON::Field(key: "CloudTrailEventId")]
    property cloud_trail_event_id : String | Nil

    @[JSON::Field(key: "KmsRequestId")]
    property kms_request_id : String | Nil

    def initialize(
      @operation : KeyLastUsageTrackingOperation | Nil = nil,
      @timestamp : Time | Nil = nil,
      @cloud_trail_event_id : String | Nil = nil,
      @kms_request_id : String | Nil = nil,
    )
    end
  end
end
