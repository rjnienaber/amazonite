private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class GetKeyLastUsageResponse
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "KeyLastUsage")]
    property key_last_usage : KeyLastUsageData | Nil

    @[JSON::Field(key: "TrackingStartDate", converter: Core::AWSEpochConverter)]
    property tracking_start_date : Time | Nil

    @[JSON::Field(key: "KeyCreationDate", converter: Core::AWSEpochConverter)]
    property key_creation_date : Time | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @key_last_usage : KeyLastUsageData | Nil = nil,
      @tracking_start_date : Time | Nil = nil,
      @key_creation_date : Time | Nil = nil,
    )
    end
  end
end
