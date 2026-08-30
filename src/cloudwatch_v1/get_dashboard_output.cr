module Amazonite::CloudWatchV1
  class GetDashboardOutput
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the dashboard.
    @[JSON::Field(key: "DashboardArn")]
    property dashboard_arn : String | Nil

    # The detailed information about the dashboard, including what widgets are included and their
    # location on the dashboard. For more information about the `DashboardBody` syntax, see [Dashboard
    # Body Structure and
    # Syntax](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Dashboard-Body-Structure.html).
    @[JSON::Field(key: "DashboardBody")]
    property dashboard_body : String | Nil

    # The name of the dashboard.
    @[JSON::Field(key: "DashboardName")]
    property dashboard_name : String | Nil

    def initialize(
      @dashboard_arn : String | Nil = nil,
      @dashboard_body : String | Nil = nil,
      @dashboard_name : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dashboard_arn, @dashboard_body, @dashboard_name)
  end
end
