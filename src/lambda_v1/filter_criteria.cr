module Amazonite::LambdaV1
  # An object that contains the filters for an event source.
  class FilterCriteria
    include JSON::Serializable

    # A list of filters.
    @[JSON::Field(key: "Filters")]
    property filters : Array(Filter) | Nil

    def initialize(
      @filters : Array(Filter) | Nil = nil,
    )
    end

    def_equals_and_hash(@filters)
  end
end
