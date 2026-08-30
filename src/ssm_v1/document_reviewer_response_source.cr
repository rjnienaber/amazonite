private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Information about a reviewer's response to a document review request.
  class DocumentReviewerResponseSource
    include JSON::Serializable

    # The date and time that a reviewer entered a response to a document review request.
    @[JSON::Field(key: "CreateTime", converter: Core::AWSEpochConverter)]
    property create_time : Time | Nil

    # The date and time that a reviewer last updated a response to a document review request.
    @[JSON::Field(key: "UpdatedTime", converter: Core::AWSEpochConverter)]
    property updated_time : Time | Nil

    # The current review status of a new custom SSM document created by a member of your organization,
    # or of the latest version of an existing SSM document.
    #
    # Only one version of a document can be in the APPROVED state at a time. When a new version is
    # approved, the status of the previous version changes to REJECTED.
    #
    # Only one version of a document can be in review, or PENDING, at a time.
    @[JSON::Field(key: "ReviewStatus", converter: AS::ReviewStatus)]
    property review_status : ReviewStatus | Nil

    # The comment entered by a reviewer as part of their document review response.
    @[JSON::Field(key: "Comment")]
    property comment : Array(DocumentReviewCommentSource) | Nil

    # The user in your organization assigned to review a document request.
    @[JSON::Field(key: "Reviewer")]
    property reviewer : String | Nil

    def initialize(
      @create_time : Time | Nil = nil,
      @updated_time : Time | Nil = nil,
      @review_status : ReviewStatus | Nil = nil,
      @comment : Array(DocumentReviewCommentSource) | Nil = nil,
      @reviewer : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @comment
        raise Core::ValidationError.new("Comment must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Comment must have at most 1 item(s)") if value.size > 1
        value.each(&.validate!)
      end

      if value = @reviewer
        raise Core::ValidationError.new("Reviewer length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Reviewer length must be <= 50") if value.size > 50
        raise Core::ValidationError.new("Reviewer does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{1,128}$"))
      end
    end

    def_equals_and_hash(@create_time, @updated_time, @review_status, @comment, @reviewer)
  end
end
