module Amazonite::CloudWatchLogsV1
  # The fields contained in log events found by a `GetLogGroupFields` operation, along with the
  # percentage of queried log events in which each field appears.
  class LogGroupField
    include JSON::Serializable

    # The name of a log field.
    @[JSON::Field(key: "name")]
    property name : String | Nil

    # The percentage of log events queried that contained the field.
    @[JSON::Field(key: "percent")]
    property percent : Int32 | Nil

    def initialize(
      @name : String | Nil = nil,
      @percent : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@name, @percent)
  end
end
