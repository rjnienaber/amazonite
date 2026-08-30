module Amazonite::CloudWatchLogsV1
  # Reserved.
  class QueryCompileErrorLocation
    include JSON::Serializable

    # Reserved.
    @[JSON::Field(key: "startCharOffset")]
    property start_char_offset : Int32 | Nil

    # Reserved.
    @[JSON::Field(key: "endCharOffset")]
    property end_char_offset : Int32 | Nil

    def initialize(
      @start_char_offset : Int32 | Nil = nil,
      @end_char_offset : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@start_char_offset, @end_char_offset)
  end
end
