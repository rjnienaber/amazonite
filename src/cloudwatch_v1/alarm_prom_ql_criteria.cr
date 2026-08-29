module Amazonite::CloudWatchV1
  class AlarmPromQLCriteria
    include JSON::Serializable

    @[JSON::Field(key: "Query")]
    property query : String

    @[JSON::Field(key: "PendingPeriod")]
    property pending_period : Int32 | Nil

    @[JSON::Field(key: "RecoveryPeriod")]
    property recovery_period : Int32 | Nil

    def initialize(
      @query : String,
      @pending_period : Int32 | Nil = nil,
      @recovery_period : Int32 | Nil = nil,
    )
    end
  end
end
