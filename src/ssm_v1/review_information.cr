private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class ReviewInformation
    include JSON::Serializable

    @[JSON::Field(key: "ReviewedTime", converter: Core::AWSEpochConverter)]
    property reviewed_time : Time | Nil

    @[JSON::Field(key: "Status", converter: AS::ReviewStatus)]
    property status : ReviewStatus | Nil

    @[JSON::Field(key: "Reviewer")]
    property reviewer : String | Nil

    def initialize(
      @reviewed_time : Time | Nil = nil,
      @status : ReviewStatus | Nil = nil,
      @reviewer : String | Nil = nil
    )
    end
  end
end
