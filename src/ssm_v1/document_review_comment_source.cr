private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class DocumentReviewCommentSource
    include JSON::Serializable

    @[JSON::Field(key: "Type", converter: AS::DocumentReviewCommentType)]
    property type : DocumentReviewCommentType | Nil

    @[JSON::Field(key: "Content")]
    property content : String | Nil

    def initialize(
      @type : DocumentReviewCommentType | Nil = nil,
      @content : String | Nil = nil
    )
    end
  end
end
