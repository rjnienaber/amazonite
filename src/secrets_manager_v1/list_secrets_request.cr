private alias ASM = Amazonite::SecretsManagerV1

module Amazonite::SecretsManagerV1
  class ListSecretsRequest
    include JSON::Serializable

    @[JSON::Field(key: "IncludePlannedDeletion")]
    property include_planned_deletion : Bool | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "Filters")]
    property filters : Array(Filter) | Nil

    @[JSON::Field(key: "SortOrder", converter: ASM::SortOrderType)]
    property sort_order : SortOrderType | Nil

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
  end
end
