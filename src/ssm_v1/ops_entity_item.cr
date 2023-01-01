module Amazonite::SsmV1
  class OpsEntityItem
    include JSON::Serializable

    @[JSON::Field(key: "CaptureTime")]
    property capture_time : String | Nil

    @[JSON::Field(key: "Content")]
    property content : Array(Hash(String, String)) | Nil

    def initialize(
      @capture_time : String | Nil = nil,
      @content : Array(Hash(String, String)) | Nil = nil
    )
    end
  end
end
