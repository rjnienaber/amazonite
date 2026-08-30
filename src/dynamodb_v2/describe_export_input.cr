module Amazonite::DynamoDBV2
  class DescribeExportInput
    include JSON::Serializable

    # The Amazon Resource Name (ARN) associated with the export.
    @[JSON::Field(key: "ExportArn")]
    property export_arn : String

    def initialize(
      @export_arn : String,
    )
    end
  end
end
