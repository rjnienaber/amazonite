private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class DescribeKinesisStreamingDestinationInput
    include JSON::Serializable

    # The name of the table being described. You can also provide the Amazon Resource Name (ARN) of
    # the table in this parameter.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    def initialize(
      @table_name : String,
    )
    end

    def validate! : Nil
      if value = @table_name
        raise Core::ValidationError.new("TableName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TableName length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@table_name)
  end
end
