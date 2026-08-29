module Amazonite::SqsV1
  class ListMessageMoveTasksResult
    include JSON::Serializable

    @[JSON::Field(key: "Results")]
    property results : Array(ListMessageMoveTasksResultEntry) | Nil

    def initialize(
      @results : Array(ListMessageMoveTasksResultEntry) | Nil = nil,
    )
    end
  end
end
