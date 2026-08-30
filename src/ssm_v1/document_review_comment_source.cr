private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @content
        raise Core::ValidationError.new("Content length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Content length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("Content does not match the required pattern") unless value.matches?(Regex.new("^(?!\\s*$).+$"))
      end
    end

    def_equals_and_hash(@type, @content)
  end
end
