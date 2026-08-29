module Amazonite::DynamoDBV2
  class SearchVectorsOutput
    include JSON::Serializable

    # The capacity units consumed by the `SearchVectors` operation. Contains
    # `VectorSearchRequestBytes`, which represents the vector search capacity consumed.
    @[JSON::Field(key: "ConsumedCapacity")]
    property consumed_capacity : VectorCapacity | Nil

    # A list of items returned by the vector similarity search, sorted by similarity with the most
    # similar item first. Each item contains the projected attributes and a similarity score.
    @[JSON::Field(key: "SearchResults")]
    property search_results : Array(SearchResultItem) | Nil

    def initialize(
      @consumed_capacity : VectorCapacity | Nil = nil,
      @search_results : Array(SearchResultItem) | Nil = nil,
    )
    end
  end
end
