module Amazonite::DynamoDBV2
  class UpdateKinesisStreamingDestinationInput
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String

    @[JSON::Field(key: "StreamArn")]
    property stream_arn : String

    @[JSON::Field(key: "UpdateKinesisStreamingConfiguration")]
    property update_kinesis_streaming_configuration : UpdateKinesisStreamingConfiguration | Nil

    def initialize(
      @table_name : String,
      @stream_arn : String,
      @update_kinesis_streaming_configuration : UpdateKinesisStreamingConfiguration | Nil = nil,
    )
    end
  end
end
