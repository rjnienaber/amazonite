module Amazonite::DynamoDBV2
  class SearchVectorsOutput
    include JSON::Serializable

    @[JSON::Field(key: "ConsumedCapacity")]
    property consumed_capacity : VectorCapacity | Nil

    @[JSON::Field(key: "SearchResults")]
    property search_results : Array(SearchResultItem) | Nil

    def initialize(
      @consumed_capacity : VectorCapacity | Nil = nil,
      @search_results : Array(SearchResultItem) | Nil = nil,
    )
    end
  end
end
