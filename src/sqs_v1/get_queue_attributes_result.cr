module Amazonite::SqsV1
  # A list of returned queue attributes.
  class GetQueueAttributesResult
    include JSON::Serializable

    # A map of attributes to their respective values.
    @[JSON::Field(key: "Attributes")]
    property attributes : Hash(QueueAttributeName, String) | Nil

    def initialize(
      @attributes : Hash(QueueAttributeName, String) | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@attributes)
  end
end
