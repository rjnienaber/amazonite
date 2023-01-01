module Amazonite::SsmV1
  class UpdateDocumentMetadataRequest
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    @[JSON::Field(key: "DocumentReviews")]
    property document_reviews : DocumentReviews

    def initialize(
      @name : String,
      @document_reviews : DocumentReviews,
      @document_version : String | Nil = nil
    )
    end
  end
end
