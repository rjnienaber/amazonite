module Amazonite::LambdaV1
  # An object that contains details about an error related to filter criteria encryption.
  class FilterCriteriaError
    include JSON::Serializable

    # The KMS exception that resulted from filter criteria encryption or decryption.
    @[JSON::Field(key: "ErrorCode")]
    property error_code : String | Nil

    # The error message.
    @[JSON::Field(key: "Message")]
    property message : String | Nil

    def initialize(
      @error_code : String | Nil = nil,
      @message : String | Nil = nil,
    )
    end
  end
end
