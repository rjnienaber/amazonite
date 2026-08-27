module Amazonite::DynamoDBV2
  class KinesisStreamingDestinationInput
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String

    @[JSON::Field(key: "StreamArn")]
    property stream_arn : String

    @[JSON::Field(key: "EnableKinesisStreamingConfiguration")]
    property enable_kinesis_streaming_configuration : EnableKinesisStreamingConfiguration | Nil

    def initialize(
      @table_name : String,
      @stream_arn : String,
      @enable_kinesis_streaming_configuration : EnableKinesisStreamingConfiguration | Nil = nil,
    )
    end
  end
end
