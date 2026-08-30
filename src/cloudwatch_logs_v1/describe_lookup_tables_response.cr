module Amazonite::CloudWatchLogsV1
  class DescribeLookupTablesResponse
    include JSON::Serializable

    # An array of structures, where each structure contains metadata about one lookup table.
    @[JSON::Field(key: "lookupTables")]
    property lookup_tables : Array(LookupTable) | Nil

    # The token to use when requesting the next set of items.
    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @lookup_tables : Array(LookupTable) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
