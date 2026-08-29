module Amazonite::DynamoDBV2
  class DescribeContinuousBackupsInput
    include JSON::Serializable

    # Name of the table for which the customer wants to check the continuous backups and point in time
    # recovery settings.
    #
    # You can also provide the Amazon Resource Name (ARN) of the table in this parameter.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    def initialize(
      @table_name : String,
    )
    end
  end
end
