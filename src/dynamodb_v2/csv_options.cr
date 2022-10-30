module Amazonite::DynamoDBV2
  class CsvOptions
    include JSON::Serializable

    @[JSON::Field(key: "Delimiter")]
    property delimiter : String | Nil

    @[JSON::Field(key: "HeaderList")]
    property header_list : Array(String) | Nil

    def initialize(
      @delimiter : String | Nil = nil,
      @header_list : Array(String) | Nil = nil
    )
    end
  end
end
