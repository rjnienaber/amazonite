private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  # Summary information about an export task.
  class ExportSummary
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the export.
    @[JSON::Field(key: "ExportArn")]
    property export_arn : String | Nil

    # Export can be in one of the following states: IN_PROGRESS, COMPLETED, or FAILED.
    @[JSON::Field(key: "ExportStatus", converter: ADDB::ExportStatus)]
    property export_status : ExportStatus | Nil

    # The type of export that was performed. Valid values are `FULL_EXPORT` or `INCREMENTAL_EXPORT`.
    @[JSON::Field(key: "ExportType", converter: ADDB::ExportType)]
    property export_type : ExportType | Nil

    def initialize(
      @export_arn : String | Nil = nil,
      @export_status : ExportStatus | Nil = nil,
      @export_type : ExportType | Nil = nil,
    )
    end

    def_equals_and_hash(@export_arn, @export_status, @export_type)
  end
end
