module Amazonite::LambdaV1
  class FilterCriteria
    include JSON::Serializable

    @[JSON::Field(key: "Filters")]
    property filters : Array(Filter) | Nil

    def initialize(
      @filters : Array(Filter) | Nil = nil,
    )
    end
  end
end
