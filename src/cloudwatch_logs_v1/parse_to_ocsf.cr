private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  # This processor converts logs into [Open Cybersecurity Schema Framework (OCSF)](https://ocsf.io)
  # events.
  #
  # For more information about this processor including examples, see
  # [parseToOCSF](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseToOCSF)
  # in the *CloudWatch Logs User Guide*.
  class ParseToOCSF
    include JSON::Serializable

    # The path to the field in the log event that you want to parse. If you omit this value, the whole
    # log message is parsed.
    @[JSON::Field(key: "source")]
    property source : String | Nil

    # Specify the service or process that produces the log events that will be converted with this
    # processor.
    @[JSON::Field(key: "eventSource", converter: ACWL::EventSource)]
    property event_source : EventSource

    # Specify which version of the OCSF schema to use for the transformed log events.
    @[JSON::Field(key: "ocsfVersion", converter: ACWL::OCSFVersion)]
    property ocsf_version : OCSFVersion

    # The version of the OCSF mapping to use for parsing log data.
    @[JSON::Field(key: "mappingVersion")]
    property mapping_version : String | Nil

    def initialize(
      @event_source : EventSource,
      @ocsf_version : OCSFVersion,
      @source : String | Nil = nil,
      @mapping_version : String | Nil = nil,
    )
    end
  end
end
