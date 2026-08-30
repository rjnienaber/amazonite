private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @comment
        raise Core::ValidationError.new("Comment must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Comment must have at most 1 item(s)") if value.size > 1
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@action, @comment)
  end
end
