module Amazonite::SsmV1
  class DocumentMetadataResponseInfo
    include JSON::Serializable

    @[JSON::Field(key: "ReviewerResponse")]
    property reviewer_response : Array(DocumentReviewerResponseSource) | Nil

    def initialize(
      @reviewer_response : Array(DocumentReviewerResponseSource) | Nil = nil
    )
    end
  end
end
