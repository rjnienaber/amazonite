module Amazonite::DynamoDBV2
  # Represents a failure a contributor insights operation.
  class FailureException
    include JSON::Serializable

    # Exception name.
    @[JSON::Field(key: "ExceptionName")]
    property exception_name : String | Nil

    # Description of the failure.
    @[JSON::Field(key: "ExceptionDescription")]
    property exception_description : String | Nil

    def initialize(
      @exception_name : String | Nil = nil,
      @exception_description : String | Nil = nil,
    )
    end
  end
end
