private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  class ExportTableToPointInTimeOutput
    include JSON::Serializable

    # Contains a description of the table export.
    @[JSON::Field(key: "ExportDescription")]
    property export_description : ExportDescription | Nil

    def initialize(
      @export_description : ExportDescription | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @export_description
        value.validate!
      end
    end

    def_equals_and_hash(@export_description)
  end
end
