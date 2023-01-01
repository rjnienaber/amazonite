module Amazonite::SsmV1
  class ListDocumentMetadataHistoryResponse
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    @[JSON::Field(key: "Author")]
    property author : String | Nil

    @[JSON::Field(key: "Metadata")]
    property metadata : DocumentMetadataResponseInfo | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @document_version : String | Nil = nil,
      @author : String | Nil = nil,
      @metadata : DocumentMetadataResponseInfo | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
