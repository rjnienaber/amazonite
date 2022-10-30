module Amazonite::DynamoDBV2
  class DescribeImportInput
    include JSON::Serializable

    @[JSON::Field(key: "ImportArn")]
    property import_arn : String

    def initialize(
      @import_arn : String
    )
    end
  end
end
