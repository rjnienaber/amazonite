private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  class DescribeExportInput
    include JSON::Serializable

    # The Amazon Resource Name (ARN) associated with the export.
    @[JSON::Field(key: "ExportArn")]
    property export_arn : String

    def initialize(
      @export_arn : String,
    )
    end

    def validate! : Nil
      if value = @export_arn
        raise Core::ValidationError.new("ExportArn length must be >= 37") if value.size < 37
        raise Core::ValidationError.new("ExportArn length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@export_arn)
  end
end
