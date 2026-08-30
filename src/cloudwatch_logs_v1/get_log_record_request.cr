module Amazonite::CloudWatchLogsV1
  class GetLogRecordRequest
    include JSON::Serializable

    # The pointer corresponding to the log event record you want to retrieve. You get this from the
    # response of a `GetQueryResults` operation. In that response, the value of the `@ptr` field for a
    # log event is the value to use as `logRecordPointer` to retrieve that complete log event record.
    @[JSON::Field(key: "logRecordPointer")]
    property log_record_pointer : String

    # Specify `true` to display the log event fields with all sensitive data unmasked and visible. The
    # default is `false`.
    #
    # To use this operation with this parameter, you must be signed into an account with the
    # `logs:Unmask` permission.
    @[JSON::Field(key: "unmask")]
    property unmask : Bool | Nil

    def initialize(
      @log_record_pointer : String,
      @unmask : Bool | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@log_record_pointer, @unmask)
  end
end
