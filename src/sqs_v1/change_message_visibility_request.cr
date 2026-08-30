module Amazonite::SqsV1
  class ChangeMessageVisibilityRequest
    include JSON::Serializable

    # The URL of the Amazon SQS queue whose message's visibility is changed.
    #
    # Queue URLs and names are case-sensitive.
    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    # The receipt handle associated with the message, whose visibility timeout is changed. This
    # parameter is returned by the ` ReceiveMessage ` action.
    @[JSON::Field(key: "ReceiptHandle")]
    property receipt_handle : String

    # The new value for the message's visibility timeout (in seconds). Values range: `0` to `43200`.
    # Maximum: 12 hours.
    @[JSON::Field(key: "VisibilityTimeout")]
    property visibility_timeout : Int32

    def initialize(
      @queue_url : String,
      @receipt_handle : String,
      @visibility_timeout : Int32,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@queue_url, @receipt_handle, @visibility_timeout)
  end
end
