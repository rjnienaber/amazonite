module Amazonite::CloudWatchV1
  class PutDashboardOutput
    include JSON::Serializable

    # If the input for `PutDashboard` was correct and the dashboard was successfully created or
    # modified, this result is empty.
    #
    # If this result includes only warning messages, then the input was valid enough for the dashboard
    # to be created or modified, but some elements of the dashboard might not render.
    #
    # If this result includes error messages, the input was not valid and the operation failed.
    @[JSON::Field(key: "DashboardValidationMessages")]
    property dashboard_validation_messages : Array(DashboardValidationMessage) | Nil

    def initialize(
      @dashboard_validation_messages : Array(DashboardValidationMessage) | Nil = nil,
    )
    end
  end
end
