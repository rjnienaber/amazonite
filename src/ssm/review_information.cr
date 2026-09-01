private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @reviewer
        raise Core::ValidationError.new("Reviewer length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Reviewer length must be <= 50") if value.size > 50
        raise Core::ValidationError.new("Reviewer does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{1,128}$"))
      end
    end

    def_equals_and_hash(@reviewed_time, @status, @reviewer)
  end
end
