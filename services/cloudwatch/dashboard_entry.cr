private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  # Represents a specific dashboard.
  class DashboardEntry
    include JSON::Serializable

    # The name of the dashboard.
    @[JSON::Field(key: "DashboardName")]
    property dashboard_name : String | Nil

    # The Amazon Resource Name (ARN) of the dashboard.
    @[JSON::Field(key: "DashboardArn")]
    property dashboard_arn : String | Nil

    # The time stamp of when the dashboard was last modified, either by an API call or through the
    # console. This number is expressed as the number of milliseconds since Jan 1, 1970 00:00:00 UTC.
    @[JSON::Field(key: "LastModified", converter: Core::AWSEpochConverter)]
    property last_modified : Time | Nil

    # The size of the dashboard, in bytes.
    @[JSON::Field(key: "Size")]
    property size : Int64 | Nil

    def initialize(
      @dashboard_name : String | Nil = nil,
      @dashboard_arn : String | Nil = nil,
      @last_modified : Time | Nil = nil,
      @size : Int64 | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dashboard_name, @dashboard_arn, @last_modified, @size)
  end
end
