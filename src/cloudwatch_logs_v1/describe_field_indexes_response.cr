private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @field_indexes
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@field_indexes, @next_token)
  end
end
