module Amazonite::Lambda
  class AddPermissionResponse
    include JSON::Serializable

    # The permission statement that's added to the function policy.
    @[JSON::Field(key: "Statement")]
    property statement : String | Nil

    def initialize(
      @statement : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@statement)
  end
end
