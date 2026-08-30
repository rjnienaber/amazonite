private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Details about the response to a document review request.
  class DocumentMetadataResponseInfo
    include JSON::Serializable

    # Details about a reviewer's response to a document review request.
    @[JSON::Field(key: "ReviewerResponse")]
    property reviewer_response : Array(DocumentReviewerResponseSource) | Nil

    def initialize(
      @reviewer_response : Array(DocumentReviewerResponseSource) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @reviewer_response
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@reviewer_response)
  end
end
