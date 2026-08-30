module Amazonite::SsmV1
  class ListDocumentsRequest
    include JSON::Serializable

    # This data type is deprecated. Instead, use `Filters`.
    @[JSON::Field(key: "DocumentFilterList")]
    property document_filter_list : Array(DocumentFilter) | Nil

    # One or more `DocumentKeyValuesFilter` objects. Use a filter to return a more specific list of
    # results. For keys, you can specify one or more key-value pair tags that have been applied to a
    # document. Other valid keys include `Owner`, `Name`, `PlatformTypes`, `DocumentType`, and
    # `TargetType`. For example, to return documents you own use `Key=Owner,Values=Self`. To specify a
    # custom key-value pair, use the format `Key=tag:tagName,Values=valueName`.
    #
    # This API operation only supports filtering documents by using a single tag key and one or more
    # tag values. For example: `Key=tag:tagName,Values=valueName1,valueName2`
    @[JSON::Field(key: "Filters")]
    property filters : Array(DocumentKeyValuesFilter) | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @document_filter_list : Array(DocumentFilter) | Nil = nil,
      @filters : Array(DocumentKeyValuesFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@document_filter_list, @filters, @max_results, @next_token)
  end
end
