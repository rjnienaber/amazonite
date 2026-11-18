private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class UpdateQueueOutput
    include JSON::Serializable

    # A description of the queue, including the updated attributes.
    @[JSON::Field(key: "QueueDescription")]
    property queue_description : QueueDescription

    def initialize(
      @queue_description : QueueDescription,
    )
    end

    def validate! : Nil
      if value = @queue_description
        value.validate!
      end
    end

    def_equals_and_hash(@queue_description)
  end
end
