module Amazonite::CloudWatchV1
  class PutDashboardInput
    include JSON::Serializable

    @[JSON::Field(key: "DashboardName")]
    property dashboard_name : String

    @[JSON::Field(key: "DashboardBody")]
    property dashboard_body : String

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    def initialize(
      @dashboard_name : String,
      @dashboard_body : String,
      @tags : Array(Tag) | Nil = nil,
    )
    end
  end
end
