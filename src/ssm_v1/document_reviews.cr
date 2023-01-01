private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class DocumentReviews
    include JSON::Serializable

    @[JSON::Field(key: "Action", converter: AS::DocumentReviewAction)]
    property action : DocumentReviewAction

    @[JSON::Field(key: "Comment")]
    property comment : Array(DocumentReviewCommentSource) | Nil

    def initialize(
      @action : DocumentReviewAction,
      @comment : Array(DocumentReviewCommentSource) | Nil = nil
    )
    end
  end
end
