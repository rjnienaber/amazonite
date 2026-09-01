private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  # A tag filter that specifies a tag key and optional tag values for filtering log groups by tags.
  class TagFilter
    include JSON::Serializable

    # The tag key to filter on.
    @[JSON::Field(key: "key")]
    property key : String

    # An optional list of tag values to filter on.
    #
    # - If you specify a filter that contains more than one value for a key, the response returns log
    # groups that match any of the specified values for that key.
    #
    # - If you don't specify values, the response returns all log groups that are tagged with that
    # key, with any or no value.
    #
    # - Use `*` for wildcard matching. For example, `prod*` matches values that start with `prod`.
    #
    # - Use `!` as a prefix for negation. For example, `!prod` matches values that are not `prod`.
    #
    # - Exact matching and negation are case-sensitive. Wildcard matching is case-insensitive.
    @[JSON::Field(key: "values")]
    property values : Array(String) | Nil

    def initialize(
      @key : String,
      @values : Array(String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @key
        raise Core::ValidationError.new("key length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("key length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("key does not match the required pattern") unless value.matches?(Regex.new("^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-@]+)$"))
      end

      if value = @values
        raise Core::ValidationError.new("values must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("values must have at most 5 item(s)") if value.size > 5
      end
    end

    def_equals_and_hash(@key, @values)
  end
end
