private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Information about the result of a document review request.
  class ReviewInformation
    include JSON::Serializable

    # The time that the reviewer took action on the document review request.
    @[JSON::Field(key: "ReviewedTime", converter: Core::AWSEpochConverter)]
    property reviewed_time : Time | Nil

    # The current status of the document review request.
    @[JSON::Field(key: "Status", converter: AS::ReviewStatus)]
    property status : ReviewStatus | Nil

    # The reviewer assigned to take action on the document review request.
    @[JSON::Field(key: "Reviewer")]
    property reviewer : String | Nil

    def initialize(
      @reviewed_time : Time | Nil = nil,
      @status : ReviewStatus | Nil = nil,
      @reviewer : String | Nil = nil,
    )
    end
  end
end
