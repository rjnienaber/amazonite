private alias Core = Amazonite::Core

module Amazonite::KinesisV1
  class DescribeStreamConsumerOutput
    include JSON::Serializable

    # An object that represents the details of the consumer.
    @[JSON::Field(key: "ConsumerDescription")]
    property consumer_description : ConsumerDescription

    def initialize(
      @consumer_description : ConsumerDescription,
    )
    end

    def validate! : Nil
      if value = @consumer_description
        value.validate!
      end
    end

    def_equals_and_hash(@consumer_description)
  end
end
