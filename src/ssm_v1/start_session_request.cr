module Amazonite::SsmV1
  class StartSessionRequest
    include JSON::Serializable

    @[JSON::Field(key: "Target")]
    property target : String

    @[JSON::Field(key: "DocumentName")]
    property document_name : String | Nil

    @[JSON::Field(key: "Reason")]
    property reason : String | Nil

    @[JSON::Field(key: "Parameters")]
    property parameters : Hash(String, Array(String)) | Nil

    def initialize(
      @target : String,
      @document_name : String | Nil = nil,
      @reason : String | Nil = nil,
      @parameters : Hash(String, Array(String)) | Nil = nil
    )
    end
  end
end
