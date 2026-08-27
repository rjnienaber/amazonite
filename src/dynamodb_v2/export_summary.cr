private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class ExportSummary
    include JSON::Serializable

    @[JSON::Field(key: "ExportArn")]
    property export_arn : String | Nil

    @[JSON::Field(key: "ExportStatus", converter: ADDB::ExportStatus)]
    property export_status : ExportStatus | Nil

    @[JSON::Field(key: "ExportType", converter: ADDB::ExportType)]
    property export_type : ExportType | Nil

    def initialize(
      @export_arn : String | Nil = nil,
      @export_status : ExportStatus | Nil = nil,
      @export_type : ExportType | Nil = nil,
    )
    end
  end
end
