private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class DashboardEntry
    include JSON::Serializable

    @[JSON::Field(key: "DashboardName")]
    property dashboard_name : String | Nil

    @[JSON::Field(key: "DashboardArn")]
    property dashboard_arn : String | Nil

    @[JSON::Field(key: "LastModified", converter: Core::AWSEpochConverter)]
    property last_modified : Time | Nil

    @[JSON::Field(key: "Size")]
    property size : Int64 | Nil

    def initialize(
      @dashboard_name : String | Nil = nil,
      @dashboard_arn : String | Nil = nil,
      @last_modified : Time | Nil = nil,
      @size : Int64 | Nil = nil,
    )
    end
  end
end
