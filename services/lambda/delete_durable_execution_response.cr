private alias Core = Amazonite::Core

module Amazonite::Lambda
  class DeleteDurableExecutionResponse
    include JSON::Serializable

    # The timestamp when Lambda accepted the deletion request (ISO 8601 format).
    @[JSON::Field(key: "DeletionRequestTimestamp", converter: Core::AWSEpochConverter)]
    property deletion_request_timestamp : Time

    def initialize(
      @deletion_request_timestamp : Time,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@deletion_request_timestamp)
  end
end
