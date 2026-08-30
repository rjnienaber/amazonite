module Amazonite::CloudWatchV1
  # This array is empty if the API operation was successful for all the rules specified in the
  # request. If the operation could not process one of the rules, the following data is returned for
  # each of those rules.
  class PartialFailure
    include JSON::Serializable

    # The specified rule that could not be deleted.
    @[JSON::Field(key: "FailureResource")]
    property failure_resource : String | Nil

    # The type of error.
    @[JSON::Field(key: "ExceptionType")]
    property exception_type : String | Nil

    # The code of the error.
    @[JSON::Field(key: "FailureCode")]
    property failure_code : String | Nil

    # A description of the error.
    @[JSON::Field(key: "FailureDescription")]
    property failure_description : String | Nil

    def initialize(
      @failure_resource : String | Nil = nil,
      @exception_type : String | Nil = nil,
      @failure_code : String | Nil = nil,
      @failure_description : String | Nil = nil,
    )
    end

    def_equals_and_hash(@failure_resource, @exception_type, @failure_code, @failure_description)
  end
end
