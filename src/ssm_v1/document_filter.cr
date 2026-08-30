private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # This data type is deprecated. Instead, use DocumentKeyValuesFilter.
  class DocumentFilter
    include JSON::Serializable

    # The name of the filter.
    @[JSON::Field(key: "key", converter: AS::DocumentFilterKey)]
    property key : DocumentFilterKey

    # The value of the filter.
    @[JSON::Field(key: "value")]
    property value : String

    def initialize(
      @key : DocumentFilterKey,
      @value : String,
    )
    end

    def validate! : Nil
      if value = @value
        raise Core::ValidationError.new("value length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@key, @value)
  end
end
