module Amazonite::LambdaV1
  # (Amazon SQS only) The scaling configuration for the event source. To remove the configuration,
  # pass an empty value.
  class ScalingConfig
    include JSON::Serializable

    # Limits the number of concurrent instances that the Amazon SQS event source can invoke.
    @[JSON::Field(key: "MaximumConcurrency")]
    property maximum_concurrency : Int32 | Nil

    def initialize(
      @maximum_concurrency : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@maximum_concurrency)
  end
end
