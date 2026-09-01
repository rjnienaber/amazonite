private alias AAG = Amazonite::ApiGateway

module Amazonite::ApiGateway
  # Quotas configured for a usage plan.
  class QuotaSettings
    include JSON::Serializable

    # The target maximum number of requests that can be made in a given time period.
    @[JSON::Field(key: "limit")]
    property limit : Int32 | Nil

    # The number of requests subtracted from the given limit in the initial time period.
    @[JSON::Field(key: "offset")]
    property offset : Int32 | Nil

    # The time period in which the limit applies. Valid values are "DAY", "WEEK" or "MONTH".
    @[JSON::Field(key: "period", converter: AAG::QuotaPeriodType)]
    property period : QuotaPeriodType | Nil

    def initialize(
      @limit : Int32 | Nil = nil,
      @offset : Int32 | Nil = nil,
      @period : QuotaPeriodType | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@limit, @offset, @period)
  end
end
