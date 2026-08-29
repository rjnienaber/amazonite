private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class MetricStreamEntry
    include JSON::Serializable

    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    @[JSON::Field(key: "CreationDate", converter: Core::AWSEpochConverter)]
    property creation_date : Time | Nil

    @[JSON::Field(key: "LastUpdateDate", converter: Core::AWSEpochConverter)]
    property last_update_date : Time | Nil

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "FirehoseArn")]
    property firehose_arn : String | Nil

    @[JSON::Field(key: "State")]
    property state : String | Nil

    @[JSON::Field(key: "OutputFormat", converter: ACW::MetricStreamOutputFormat)]
    property output_format : MetricStreamOutputFormat | Nil

    def initialize(
      @arn : String | Nil = nil,
      @creation_date : Time | Nil = nil,
      @last_update_date : Time | Nil = nil,
      @name : String | Nil = nil,
      @firehose_arn : String | Nil = nil,
      @state : String | Nil = nil,
      @output_format : MetricStreamOutputFormat | Nil = nil,
    )
    end
  end
end
