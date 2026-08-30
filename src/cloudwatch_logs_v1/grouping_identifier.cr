module Amazonite::CloudWatchLogsV1
  # A key-value pair that identifies how log groups are grouped in aggregate summaries.
  class GroupingIdentifier
    include JSON::Serializable

    # The key that identifies the grouping characteristic. The format of the key uses dot notation.
    # Examples are, `dataSource.Name`, `dataSource.Type`, and `dataSource.Format`.
    @[JSON::Field(key: "key")]
    property key : String | Nil

    # The value associated with the grouping characteristic. Examples are `amazon_vpc`, `flow`, and
    # `OCSF`.
    @[JSON::Field(key: "value")]
    property value : String | Nil

    def initialize(
      @key : String | Nil = nil,
      @value : String | Nil = nil,
    )
    end

    def_equals_and_hash(@key, @value)
  end
end
