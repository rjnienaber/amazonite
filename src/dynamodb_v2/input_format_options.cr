module Amazonite::DynamoDBv2
  class InputFormatOptions
    include JSON::Serializable

    @[JSON::Field(key: "Csv")]
    property csv : CsvOptions | Nil

    def initialize(
      @csv : CsvOptions | Nil = nil
    )
    end
  end
end