module Amazonite::SsmV1
  # The OpsData summary.
  class OpsEntityItem
    include JSON::Serializable

    # The time the OpsData was captured.
    @[JSON::Field(key: "CaptureTime")]
    property capture_time : String | Nil

    # The details of an OpsData summary.
    @[JSON::Field(key: "Content")]
    property content : Array(Hash(String, String)) | Nil

    def initialize(
      @capture_time : String | Nil = nil,
      @content : Array(Hash(String, String)) | Nil = nil,
    )
    end

    def_equals_and_hash(@capture_time, @content)
  end
end
