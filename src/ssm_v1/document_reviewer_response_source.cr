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
  end
end
