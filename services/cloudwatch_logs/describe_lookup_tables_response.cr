private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @lookup_tables
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@lookup_tables, @next_token)
  end
end
