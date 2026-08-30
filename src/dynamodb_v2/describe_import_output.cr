private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class DescribeImportOutput
    include JSON::Serializable

    # Represents the properties of the table created for the import, and parameters of the import. The
    # import parameters include import status, how many items were processed, and how many errors were
    # encountered.
    @[JSON::Field(key: "ImportTableDescription")]
    property import_table_description : ImportTableDescription

    def initialize(
      @import_table_description : ImportTableDescription,
    )
    end

    def validate! : Nil
      if value = @import_table_description
        value.validate!
      end
    end

    def_equals_and_hash(@import_table_description)
  end
end
