module Amazonite::SqsV1
  class ListMessageMoveTasksResult
    include JSON::Serializable

    # A list of message movement tasks and their attributes.
    @[JSON::Field(key: "Results")]
    property results : Array(ListMessageMoveTasksResultEntry) | Nil

    def initialize(
      @results : Array(ListMessageMoveTasksResultEntry) | Nil = nil,
    )
    end

    def_equals_and_hash(@results)
  end
end
