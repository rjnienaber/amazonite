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
  end
end
