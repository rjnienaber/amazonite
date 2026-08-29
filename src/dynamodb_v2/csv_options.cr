module Amazonite::DynamoDBV2
  # Processing options for the CSV file being imported.
  class CsvOptions
    include JSON::Serializable

    # The delimiter used for separating items in the CSV file being imported.
    @[JSON::Field(key: "Delimiter")]
    property delimiter : String | Nil

    # List of the headers used to specify a common header for all source CSV files being imported. If
    # this field is specified then the first line of each CSV file is treated as data instead of the
    # header. If this field is not specified the the first line of each CSV file is treated as the
    # header.
    @[JSON::Field(key: "HeaderList")]
    property header_list : Array(String) | Nil

    def initialize(
      @delimiter : String | Nil = nil,
      @header_list : Array(String) | Nil = nil,
    )
    end
  end
end
