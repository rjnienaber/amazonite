module Amazonite::DynamoDBV2
  class DescribeImportInput
    include JSON::Serializable

    # The Amazon Resource Name (ARN) associated with the table you're importing to.
    @[JSON::Field(key: "ImportArn")]
    property import_arn : String

    def initialize(
      @import_arn : String,
    )
    end
  end
end
