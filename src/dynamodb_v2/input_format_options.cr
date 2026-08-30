module Amazonite::DynamoDBV2
  # The format options for the data that was imported into the target table. There is one value,
  # CsvOption.
  class InputFormatOptions
    include JSON::Serializable

    # The options for imported source files in CSV format. The values are Delimiter and HeaderList.
    @[JSON::Field(key: "Csv")]
    property csv : CsvOptions | Nil

    def initialize(
      @csv : CsvOptions | Nil = nil,
    )
    end

    def_equals_and_hash(@csv)
  end
end
