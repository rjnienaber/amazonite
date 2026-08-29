module Amazonite::LambdaV1
  class AddPermissionResponse
    include JSON::Serializable

    # The permission statement that's added to the function policy.
    @[JSON::Field(key: "Statement")]
    property statement : String | Nil

    def initialize(
      @statement : String | Nil = nil,
    )
    end
  end
end
