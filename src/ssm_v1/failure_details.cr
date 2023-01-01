module Amazonite::SsmV1
  class FailureDetails
    include JSON::Serializable

    @[JSON::Field(key: "FailureStage")]
    property failure_stage : String | Nil

    @[JSON::Field(key: "FailureType")]
    property failure_type : String | Nil

    @[JSON::Field(key: "Details")]
    property details : Hash(String, Array(String)) | Nil

    def initialize(
      @failure_stage : String | Nil = nil,
      @failure_type : String | Nil = nil,
      @details : Hash(String, Array(String)) | Nil = nil
    )
    end
  end
end
