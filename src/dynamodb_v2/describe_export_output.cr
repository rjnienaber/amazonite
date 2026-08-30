module Amazonite::DynamoDBV2
  class DescribeExportOutput
    include JSON::Serializable

    # Represents the properties of the export.
    @[JSON::Field(key: "ExportDescription")]
    property export_description : ExportDescription | Nil

    def initialize(
      @export_description : ExportDescription | Nil = nil,
    )
    end

    def_equals_and_hash(@export_description)
  end
end
