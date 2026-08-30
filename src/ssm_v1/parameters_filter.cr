private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  # This data type is deprecated. Instead, use ParameterStringFilter.
  class ParametersFilter
    include JSON::Serializable

    # The name of the filter.
    @[JSON::Field(key: "Key", converter: AS::ParametersFilterKey)]
    property key : ParametersFilterKey

    # The filter values.
    @[JSON::Field(key: "Values")]
    property values : Array(String) = [] of String

    def initialize(
      @key : ParametersFilterKey,
      @values : Array(String),
    )
    end

    def_equals_and_hash(@key, @values)
  end
end
