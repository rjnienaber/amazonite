module Amazonite::DynamoDBV2
  class ExportTableToPointInTimeOutput
    include JSON::Serializable

    @[JSON::Field(key: "ExportDescription")]
    property export_description : ExportDescription | Nil

    def initialize(
      @export_description : ExportDescription | Nil = nil
    )
    end
  end
end
