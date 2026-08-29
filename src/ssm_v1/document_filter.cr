private alias AS = Amazonite::SsmV1

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
  end
end
