private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class ListSyslogConfigurationsResponse
    include JSON::Serializable

    # The list of syslog configurations.
    @[JSON::Field(key: "syslogConfigurations")]
    property syslog_configurations : Array(SyslogConfiguration) | Nil

    # The token for the next set of items to return. The token expires after 24 hours.
    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @syslog_configurations : Array(SyslogConfiguration) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @syslog_configurations
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@syslog_configurations, @next_token)
  end
end
