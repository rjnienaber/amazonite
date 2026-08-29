module Amazonite::SecretsManagerV1
  class RotationRulesType
    include JSON::Serializable

    @[JSON::Field(key: "AutomaticallyAfterDays")]
    property automatically_after_days : Int64 | Nil

    @[JSON::Field(key: "Duration")]
    property duration : String | Nil

    @[JSON::Field(key: "ScheduleExpression")]
    property schedule_expression : String | Nil

    def initialize(
      @automatically_after_days : Int64 | Nil = nil,
      @duration : String | Nil = nil,
      @schedule_expression : String | Nil = nil,
    )
    end
  end
end
