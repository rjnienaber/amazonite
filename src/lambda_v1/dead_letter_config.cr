module Amazonite::LambdaV1
  class DeadLetterConfig
    include JSON::Serializable

    @[JSON::Field(key: "TargetArn")]
    property target_arn : String | Nil

    def initialize(
      @target_arn : String | Nil = nil,
    )
    end
  end
end
