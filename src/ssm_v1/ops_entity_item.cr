private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @capture_time
        raise Core::ValidationError.new("CaptureTime does not match the required pattern") unless value.matches?(Regex.new("^(20)[0-9][0-9]-(0[1-9]|1[012])-([12][0-9]|3[01]|0[1-9])(T)(2[0-3]|[0-1][0-9])(:[0-5][0-9])(:[0-5][0-9])(Z)$"))
      end

      if value = @content
        raise Core::ValidationError.new("Content must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Content must have at most 10000 item(s)") if value.size > 10000
      end
    end

    def_equals_and_hash(@capture_time, @content)
  end
end
