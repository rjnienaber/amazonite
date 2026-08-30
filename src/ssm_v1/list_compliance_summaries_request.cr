private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class ListComplianceSummariesRequest
    include JSON::Serializable

    # One or more compliance or inventory filters. Use a filter to return a more specific list of
    # results.
    @[JSON::Field(key: "Filters")]
    property filters : Array(ComplianceStringFilter) | Nil

    # A token to start the list. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of items to return for this call. Currently, you can specify null or 50. The
    # call also returns a token that you can specify in a subsequent call to get the next set of
    # results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @filters : Array(ComplianceStringFilter) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 50") if value > 50
      end
    end

    def_equals_and_hash(@filters, @next_token, @max_results)
  end
end
