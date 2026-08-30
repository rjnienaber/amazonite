module Amazonite::LambdaV1
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
  end
end
