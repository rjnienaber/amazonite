private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class IncrementalExportSpecification
    include JSON::Serializable

    @[JSON::Field(key: "ExportFromTime", converter: Core::AWSEpochConverter)]
    property export_from_time : Time | Nil

    @[JSON::Field(key: "ExportToTime", converter: Core::AWSEpochConverter)]
    property export_to_time : Time | Nil

    @[JSON::Field(key: "ExportViewType", converter: ADDB::ExportViewType)]
    property export_view_type : ExportViewType | Nil

    def initialize(
      @export_from_time : Time | Nil = nil,
      @export_to_time : Time | Nil = nil,
      @export_view_type : ExportViewType | Nil = nil,
    )
    end
  end
end
