module Amazonite::SqsV1
  class CancelMessageMoveTaskResult
    include JSON::Serializable

    # The approximate number of messages already moved to the destination queue.
    @[JSON::Field(key: "ApproximateNumberOfMessagesMoved")]
    property approximate_number_of_messages_moved : Int64 | Nil

    def initialize(
      @approximate_number_of_messages_moved : Int64 | Nil = nil,
    )
    end

    def_equals_and_hash(@approximate_number_of_messages_moved)
  end
end
