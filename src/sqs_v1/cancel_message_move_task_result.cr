module Amazonite::SqsV1
  class CancelMessageMoveTaskResult
    include JSON::Serializable

    @[JSON::Field(key: "ApproximateNumberOfMessagesMoved")]
    property approximate_number_of_messages_moved : Int64 | Nil

    def initialize(
      @approximate_number_of_messages_moved : Int64 | Nil = nil,
    )
    end
  end
end
