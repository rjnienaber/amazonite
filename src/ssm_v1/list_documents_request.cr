module Amazonite::SsmV1
  class ListDocumentsRequest
    include JSON::Serializable

    @[JSON::Field(key: "DocumentFilterList")]
    property document_filter_list : Array(DocumentFilter) | Nil

    @[JSON::Field(key: "Filters")]
    property filters : Array(DocumentKeyValuesFilter) | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @document_filter_list : Array(DocumentFilter) | Nil = nil,
      @filters : Array(DocumentKeyValuesFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
