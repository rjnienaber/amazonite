module Amazonite::DynamoDBv2
  class DescribeImportOutput
    include JSON::Serializable

    @[JSON::Field(key: "ImportTableDescription")]
    property import_table_description : ImportTableDescription

    def initialize(
      @import_table_description : ImportTableDescription
    )
    end
  end
end
