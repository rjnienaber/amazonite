private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class ListDocumentMetadataHistoryRequest
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    @[JSON::Field(key: "Metadata", converter: AS::DocumentMetadataEnum)]
    property metadata : DocumentMetadataEnum

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @name : String,
      @metadata : DocumentMetadataEnum,
      @document_version : String | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil
    )
    end
  end
end
