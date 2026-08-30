module Amazonite::CloudWatchLogsV1
  class DescribeLookupTablesRequest
    include JSON::Serializable

    # A prefix to filter lookup tables by name. Only tables whose names start with this prefix are
    # returned. If you don't specify a prefix, all tables in the account and Region are returned.
    @[JSON::Field(key: "lookupTableNamePrefix")]
    property lookup_table_name_prefix : String | Nil

    # The maximum number of lookup tables to return in the response. The default value is 50 and the
    # maximum value is 100.
    @[JSON::Field(key: "maxResults")]
    property max_results : Int32 | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @lookup_table_name_prefix : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@lookup_table_name_prefix, @max_results, @next_token)
  end
end
