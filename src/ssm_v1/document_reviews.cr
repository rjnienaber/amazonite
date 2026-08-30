private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  # Information about a document approval review.
  class DocumentReviews
    include JSON::Serializable

    # The action to take on a document approval review request.
    @[JSON::Field(key: "Action", converter: AS::DocumentReviewAction)]
    property action : DocumentReviewAction

    # A comment entered by a user in your organization about the document review request.
    @[JSON::Field(key: "Comment")]
    property comment : Array(DocumentReviewCommentSource) | Nil

    def initialize(
      @action : DocumentReviewAction,
      @comment : Array(DocumentReviewCommentSource) | Nil = nil,
    )
    end
  end
end
