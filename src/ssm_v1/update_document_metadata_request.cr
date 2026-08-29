module Amazonite::SsmV1
  class UpdateDocumentMetadataRequest
    include JSON::Serializable

    # The name of the change template for which a version's metadata is to be updated.
    @[JSON::Field(key: "Name")]
    property name : String

    # The version of a change template in which to update approval metadata.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # The change template review details to update.
    @[JSON::Field(key: "DocumentReviews")]
    property document_reviews : DocumentReviews

    def initialize(
      @name : String,
      @document_reviews : DocumentReviews,
      @document_version : String | Nil = nil,
    )
    end
  end
end
