module Amazonite::LambdaV1
  # The self-managed Apache Kafka cluster for your event source.
  class SelfManagedEventSource
    include JSON::Serializable

    # The list of bootstrap servers for your Kafka brokers in the following format:
    # `"KAFKA_BOOTSTRAP_SERVERS": ["abc.xyz.com:xxxx","abc2.xyz.com:xxxx"]`.
    @[JSON::Field(key: "Endpoints")]
    property endpoints : Hash(EndPointType, Array(String)) | Nil

    def initialize(
      @endpoints : Hash(EndPointType, Array(String)) | Nil = nil,
    )
    end

    def_equals_and_hash(@endpoints)
  end
end
