private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class CreateQueueInput
    include JSON::Serializable

    # A name for the queue. The name is scoped to the Amazon Web Services account and Region used by
    # the request, so two queues in different accounts, or in the same account and different Regions,
    # can have the same name.
    @[JSON::Field(key: "QueueName")]
    property queue_name : String

    # The data stream the queue delivers records from, and the position in that stream where delivery
    # begins. The list must contain exactly one entry, because a queue delivers records from a single
    # data stream.
    @[JSON::Field(key: "StreamConfigurationList")]
    property stream_configuration_list : Array(QueueStreamConfiguration) = [] of QueueStreamConfiguration

    # The configuration attributes for the queue, including its visibility timeout and its dead-letter
    # handling configuration.
    @[JSON::Field(key: "QueueAttributes")]
    property queue_attributes : QueueAttributes | Nil

    # A set of up to 50 key-value pairs to apply to the queue. You can also add, change, and remove
    # tags after the queue is created with TagResource and UntagResource.
    @[JSON::Field(key: "Tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @queue_name : String,
      @stream_configuration_list : Array(QueueStreamConfiguration),
      @queue_attributes : QueueAttributes | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @queue_name
        raise Core::ValidationError.new("QueueName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("QueueName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("QueueName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @stream_configuration_list
        raise Core::ValidationError.new("StreamConfigurationList must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("StreamConfigurationList must have at most 10000 item(s)") if value.size > 10000
        value.each(&.validate!)
      end

      if value = @queue_attributes
        value.validate!
      end

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("Tags must have at most 200 entry(s)") if value.size > 200
      end
    end

    def_equals_and_hash(@queue_name, @stream_configuration_list, @queue_attributes, @tags)
  end
end
