module Amazonite::LambdaV1
  class DurableConfig
    include JSON::Serializable

    @[JSON::Field(key: "KMSKeyArn")]
    property kms_key_arn : String | Nil

    @[JSON::Field(key: "RetentionPeriodInDays")]
    property retention_period_in_days : Int32 | Nil

    @[JSON::Field(key: "ExecutionTimeout")]
    property execution_timeout : Int32 | Nil

    def initialize(
      @kms_key_arn : String | Nil = nil,
      @retention_period_in_days : Int32 | Nil = nil,
      @execution_timeout : Int32 | Nil = nil,
    )
    end
  end
end
