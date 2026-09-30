private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @values
        raise Core::ValidationError.new("Values must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Values must have at most 50 item(s)") if value.size > 50
      end
    end

    def_equals_and_hash(@key, @values)
  end
end
