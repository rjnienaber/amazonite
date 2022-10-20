module Amazonite::DynamoDBv2
  class DescribeExportInput
    include JSON::Serializable

    @[JSON::Field(key: "ExportArn")]
    property export_arn : String

    def initialize(
      @export_arn : String
    )
    end
  end
end
