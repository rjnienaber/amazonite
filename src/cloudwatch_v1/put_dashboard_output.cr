module Amazonite::CloudWatchV1
  class PutDashboardOutput
    include JSON::Serializable

    @[JSON::Field(key: "DashboardValidationMessages")]
    property dashboard_validation_messages : Array(DashboardValidationMessage) | Nil

    def initialize(
      @dashboard_validation_messages : Array(DashboardValidationMessage) | Nil = nil,
    )
    end
  end
end
