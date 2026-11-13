private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  class ListMetricDataQueryDefinitionsInput
    include JSON::Serializable

    # The maximum number of metric data query definitions to return in one call. The default is 100.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # The token returned by a previous call to indicate where to continue retrieving results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 100") if value > 100
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("NextToken does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9_-]+$"))
      end
    end

    def_equals_and_hash(@max_results, @next_token)
  end
end
