private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class DescribeContributorInsightsInput
    include JSON::Serializable

    # The name of the table to describe. You can also provide the Amazon Resource Name (ARN) of the
    # table in this parameter.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    # The name of the global secondary index to describe, if applicable.
    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    def initialize(
      @table_name : String,
      @index_name : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @table_name
        raise Core::ValidationError.new("TableName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TableName length must be <= 1024") if value.size > 1024
      end

      if value = @index_name
        raise Core::ValidationError.new("IndexName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("IndexName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("IndexName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end
    end

    def_equals_and_hash(@table_name, @index_name)
  end
end
