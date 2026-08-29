module Amazonite::CloudWatchV1
  class DashboardValidationMessage
    include JSON::Serializable

    @[JSON::Field(key: "DataPath")]
    property data_path : String | Nil

    @[JSON::Field(key: "Message")]
    property message : String | Nil

    def initialize(
      @data_path : String | Nil = nil,
      @message : String | Nil = nil,
    )
    end
  end
end
