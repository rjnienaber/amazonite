module Amazonite::DynamoDBV2
  class KinesisStreamingDestinationInput
    include JSON::Serializable

    # The name of the DynamoDB table. You can also provide the Amazon Resource Name (ARN) of the table
    # in this parameter.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    # The ARN for a Kinesis data stream.
    @[JSON::Field(key: "StreamArn")]
    property stream_arn : String

    # The source for the Kinesis streaming information that is being enabled.
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
