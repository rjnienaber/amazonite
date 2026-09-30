private alias Core = Amazonite::Core

module Amazonite::DynamoDB
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

    def validate! : Nil
      if value = @delimiter
        raise Core::ValidationError.new("Delimiter length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Delimiter length must be <= 1") if value.size > 1
        raise Core::ValidationError.new("Delimiter does not match the required pattern") unless value.matches?(Regex.new("^[,;:|\\t ]$"))
      end

      if value = @header_list
        raise Core::ValidationError.new("HeaderList must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("HeaderList must have at most 255 item(s)") if value.size > 255
      end
    end

    def_equals_and_hash(@delimiter, @header_list)
  end
end
