module Amazonite::EventBridgeV1
  # The retry strategy to use for failed jobs, if the target is an Batch job. If you specify a retry
  # strategy here, it overrides the retry strategy defined in the job definition.
  class BatchRetryStrategy
    include JSON::Serializable

    # The number of times to attempt to retry, if the job fails. Valid values are 1–10.
    @[JSON::Field(key: "Attempts")]
    property attempts : Int32 | Nil

    def initialize(
      @attempts : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@attempts)
  end
end
