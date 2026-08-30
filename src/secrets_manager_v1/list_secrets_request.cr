private alias ASM = Amazonite::SecretsManagerV1
private alias Core = Amazonite::Core

module Amazonite::SecretsManagerV1
  class ListSecretsRequest
    include JSON::Serializable

    # Specifies whether to include secrets scheduled for deletion. By default, secrets scheduled for
    # deletion aren't included.
    @[JSON::Field(key: "IncludePlannedDeletion")]
    property include_planned_deletion : Bool | Nil

    # The number of results to include in the response.
    #
    # If there are more results available, in the response, Secrets Manager includes `NextToken`. To
    # get the next results, call `ListSecrets` again with the value from `NextToken`.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # A token that indicates where the output should continue from, if a previous call did not show
    # all results. To get the next results, call `ListSecrets` again with this value.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The filters to apply to the list of secrets.
    @[JSON::Field(key: "Filters")]
    property filters : Array(Filter) | Nil

    # Secrets are listed by `CreatedDate`.
    @[JSON::Field(key: "SortOrder", converter: ASM::SortOrderType)]
    property sort_order : SortOrderType | Nil

    # If not specified, secrets are listed by `CreatedDate`.
    @[JSON::Field(key: "SortBy", converter: ASM::SortByType)]
    property sort_by : SortByType | Nil

    def initialize(
      @include_planned_deletion : Bool | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @sort_order : SortOrderType | Nil = nil,
      @sort_by : SortByType | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 100") if value > 100
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 4096") if value.size > 4096
      end

      if value = @filters
        raise Core::ValidationError.new("Filters must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Filters must have at most 10 item(s)") if value.size > 10
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@include_planned_deletion, @max_results, @next_token, @filters, @sort_order, @sort_by)
  end
end
