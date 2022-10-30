module Amazonite::DynamoDBV2
  class FailureException
    include JSON::Serializable

    @[JSON::Field(key: "ExceptionName")]
    property exception_name : String | Nil

    @[JSON::Field(key: "ExceptionDescription")]
    property exception_description : String | Nil

    def initialize(
      @exception_name : String | Nil = nil,
      @exception_description : String | Nil = nil
    )
    end
  end
end
