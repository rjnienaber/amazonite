private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @endpoints
        raise Core::ValidationError.new("Endpoints must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("Endpoints must have at most 2 entry(s)") if value.size > 2
      end
    end

    def_equals_and_hash(@endpoints)
  end
end
