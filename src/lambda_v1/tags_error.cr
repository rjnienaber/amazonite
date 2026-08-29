module Amazonite::LambdaV1
  class TagsError
    include JSON::Serializable

    @[JSON::Field(key: "ErrorCode")]
    property error_code : String

    @[JSON::Field(key: "Message")]
    property message : String

    def initialize(
      @error_code : String,
      @message : String,
    )
    end
  end
end
