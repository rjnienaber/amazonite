module Amazonite::SsmV1
  class CloudWatchOutputConfig
    include JSON::Serializable

    @[JSON::Field(key: "CloudWatchLogGroupName")]
    property cloud_watch_log_group_name : String | Nil

    @[JSON::Field(key: "CloudWatchOutputEnabled")]
    property cloud_watch_output_enabled : Bool | Nil

    def initialize(
      @cloud_watch_log_group_name : String | Nil = nil,
      @cloud_watch_output_enabled : Bool | Nil = nil
    )
    end
  end
end
