module Amazonite::DynamoDBV2
  class UpdateKinesisStreamingDestinationInput
    include JSON::Serializable

    # The table name for the Kinesis streaming destination input. You can also provide the ARN of the
    # table in this parameter.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    # The Amazon Resource Name (ARN) for the Kinesis stream input.
    @[JSON::Field(key: "StreamArn")]
    property stream_arn : String

    # The command to update the Kinesis stream configuration.
    @[JSON::Field(key: "UpdateKinesisStreamingConfiguration")]
    property update_kinesis_streaming_configuration : UpdateKinesisStreamingConfiguration | Nil

    def initialize(
      @table_name : String,
      @stream_arn : String,
      @update_kinesis_streaming_configuration : UpdateKinesisStreamingConfiguration | Nil = nil,
    )
    end

    def_equals_and_hash(@table_name, @stream_arn, @update_kinesis_streaming_configuration)
  end
end
