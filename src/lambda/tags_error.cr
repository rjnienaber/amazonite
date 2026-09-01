private alias Core = Amazonite::Core

module Amazonite::Lambda
  # An object that contains details about an error related to retrieving tags.
  class TagsError
    include JSON::Serializable

    # The error code.
    @[JSON::Field(key: "ErrorCode")]
    property error_code : String

    # The error message.
    @[JSON::Field(key: "Message")]
    property message : String

    def initialize(
      @error_code : String,
      @message : String,
    )
    end

    def validate! : Nil
      if value = @error_code
        raise Core::ValidationError.new("ErrorCode length must be >= 10") if value.size < 10
        raise Core::ValidationError.new("ErrorCode length must be <= 21") if value.size > 21
        raise Core::ValidationError.new("ErrorCode does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z]+Exception$"))
      end

      if value = @message
        raise Core::ValidationError.new("Message length must be >= 84") if value.size < 84
        raise Core::ValidationError.new("Message length must be <= 1000") if value.size > 1000
        raise Core::ValidationError.new("Message does not match the required pattern") unless value.matches?(Regex.new("^.*$"))
      end
    end

    def_equals_and_hash(@error_code, @message)
  end
end
