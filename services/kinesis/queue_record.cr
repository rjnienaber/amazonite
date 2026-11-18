private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # A data stream record, as delivered through a queue.
  class QueueRecord
    include JSON::Serializable

    # The identifier you use to acknowledge this record, change its visibility, or restore it after it
    # becomes a dead-letter record. A new receipt handle is issued each time the record is received.
    @[JSON::Field(key: "ReceiptHandle")]
    property receipt_handle : String

    # The unique identifier of the record. This value stays the same across every delivery of the
    # record, and it is the same in every queue on the stream that delivers the record. To identify a
    # single delivery, use `ReceiptHandle` instead.
    @[JSON::Field(key: "RecordId")]
    property record_id : String

    # The partition key the record was written to the data stream with.
    @[JSON::Field(key: "PartitionKey")]
    property partition_key : String | Nil

    # The data blob of the record. Amazon Kinesis Data Streams does not inspect, interpret, or change
    # the data.
    @[JSON::Field(key: "Data", converter: Core::Base64Converter)]
    property data : Bytes

    # The approximate time the record arrived in the data stream. The difference between this value
    # and the current time is how long the record took to reach your queue consumer.
    @[JSON::Field(key: "ApproximateArrivalTimestamp", converter: Core::AWSEpochConverter)]
    property approximate_arrival_timestamp : Time

    # The approximate time the record was first received from the queue.
    @[JSON::Field(key: "FirstReceiveTimestamp", converter: Core::AWSEpochConverter)]
    property first_receive_timestamp : Time

    # The number of times this record has been received without being acknowledged.
    @[JSON::Field(key: "ReceiveCount")]
    property receive_count : Int32

    def initialize(
      @receipt_handle : String,
      @record_id : String,
      @data : Bytes,
      @approximate_arrival_timestamp : Time,
      @first_receive_timestamp : Time,
      @receive_count : Int32,
      @partition_key : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @receipt_handle
        raise Core::ValidationError.new("ReceiptHandle length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ReceiptHandle length must be <= 1024") if value.size > 1024
      end

      if value = @record_id
        raise Core::ValidationError.new("RecordId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RecordId length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("RecordId does not match the required pattern") unless value.matches?(Regex.new("^[a-z0-9]+$"))
      end

      if value = @partition_key
        raise Core::ValidationError.new("PartitionKey length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PartitionKey length must be <= 256") if value.size > 256
      end

      if value = @data
        raise Core::ValidationError.new("Data length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Data length must be <= 10485760") if value.size > 10485760
      end

      if value = @receive_count
        raise Core::ValidationError.new("ReceiveCount value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@receipt_handle, @record_id, @partition_key, @data, @approximate_arrival_timestamp, @first_receive_timestamp, @receive_count)
  end
end
