private alias AK = Amazonite::Kinesis
private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # The position in a data stream from which a queue begins delivering records.
  class QueueStartingPosition
    include JSON::Serializable

    # You can set the starting position to one of the following values:
    #
    # `LATEST`: Delivers records that arrive after you create the queue. This is the default.
    #
    # `TRIM_HORIZON`: Start delivering at the last untrimmed record in the stream, which is the oldest
    # record the stream still retains.
    #
    # `AT_TIMESTAMP`: Delivers records that arrive at or after a time stamp that you provide.
    @[JSON::Field(key: "Type", converter: AK::QueueStartingPositionType)]
    property type : QueueStartingPositionType

    # The approximate time from which the queue begins delivering records. Records that arrive at
    # approximately this time or later are delivered.
    #
    # In a request, specify this value only when `Type` is `AT_TIMESTAMP`. It is required in that
    # case, and specifying it for any other type returns a `ValidationException`.
    #
    # In a response, this value is approximate and reflects the queue's effective starting position.
    # While the queue is `CREATING`, the response echoes what you configured: for `AT_TIMESTAMP`, the
    # timestamp you provided, and for `TRIM_HORIZON` and `LATEST`, this member is absent because the
    # effective position is not yet determined. Once the queue is `ACTIVE`, the response always
    # includes this member. For `AT_TIMESTAMP`, it is the timestamp you provided or the earliest time
    # the stream can be read from, whichever is later.
    @[JSON::Field(key: "Timestamp", converter: Core::AWSEpochConverter)]
    property timestamp : Time | Nil

    def initialize(
      @type : QueueStartingPositionType,
      @timestamp : Time | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@type, @timestamp)
  end
end
