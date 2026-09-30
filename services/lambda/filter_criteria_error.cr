private alias Core = Amazonite::Core

module Amazonite::Lambda
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

    def validate! : Nil
      if value = @error_code
        raise Core::ValidationError.new("ErrorCode length must be >= 10") if value.size < 10
        raise Core::ValidationError.new("ErrorCode length must be <= 50") if value.size > 50
        raise Core::ValidationError.new("ErrorCode does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z]+Exception$"))
      end

      if value = @message
        raise Core::ValidationError.new("Message length must be >= 10") if value.size < 10
        raise Core::ValidationError.new("Message length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("Message does not match the required pattern") unless value.matches?(Regex.new(".*"))
      end
    end

    def_equals_and_hash(@error_code, @message)
  end
end
