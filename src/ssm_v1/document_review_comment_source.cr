private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  # Information about comments added to a document review request.
  class DocumentReviewCommentSource
    include JSON::Serializable

    # The type of information added to a review request. Currently, only the value `Comment` is
    # supported.
    @[JSON::Field(key: "Type", converter: AS::DocumentReviewCommentType)]
    property type : DocumentReviewCommentType | Nil

    # The content of a comment entered by a user who requests a review of a new document version, or
    # who reviews the new version.
    @[JSON::Field(key: "Content")]
    property content : String | Nil

    def initialize(
      @type : DocumentReviewCommentType | Nil = nil,
      @content : String | Nil = nil,
    )
    end
  end
end
