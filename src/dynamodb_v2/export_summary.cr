private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class ExportSummary
    include JSON::Serializable

    @[JSON::Field(key: "ExportArn")]
    property export_arn : String | Nil

    @[JSON::Field(key: "ExportStatus", converter: ADDB::ExportStatus)]
    property export_status : ExportStatus | Nil

    def initialize(
      @export_arn : String | Nil = nil,
      @export_status : ExportStatus | Nil = nil
    )
    end
  end
end
