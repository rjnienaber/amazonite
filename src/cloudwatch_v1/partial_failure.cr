module Amazonite::CloudWatchV1
  class PartialFailure
    include JSON::Serializable

    @[JSON::Field(key: "FailureResource")]
    property failure_resource : String | Nil

    @[JSON::Field(key: "ExceptionType")]
    property exception_type : String | Nil

    @[JSON::Field(key: "FailureCode")]
    property failure_code : String | Nil

    @[JSON::Field(key: "FailureDescription")]
    property failure_description : String | Nil

    def initialize(
      @failure_resource : String | Nil = nil,
      @exception_type : String | Nil = nil,
      @failure_code : String | Nil = nil,
      @failure_description : String | Nil = nil,
    )
    end
  end
end
