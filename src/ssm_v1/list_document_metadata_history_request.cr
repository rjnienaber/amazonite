private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class ListDocumentMetadataHistoryRequest
    include JSON::Serializable

    # The name of the change template.
    @[JSON::Field(key: "Name")]
    property name : String

    # The version of the change template.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # The type of data for which details are being requested. Currently, the only supported value is
    # `DocumentReviews`.
    @[JSON::Field(key: "Metadata", converter: AS::DocumentMetadataEnum)]
    property metadata : DocumentMetadataEnum

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @name : String,
      @metadata : DocumentMetadataEnum,
      @document_version : String | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@name, @document_version, @metadata, @next_token, @max_results)
  end
end
