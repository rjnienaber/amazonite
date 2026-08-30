module Amazonite::CloudWatchLogsV1
  class DescribeFieldIndexesResponse
    include JSON::Serializable

    # An array containing the field index information.
    @[JSON::Field(key: "fieldIndexes")]
    property field_indexes : Array(FieldIndex) | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @field_indexes : Array(FieldIndex) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
