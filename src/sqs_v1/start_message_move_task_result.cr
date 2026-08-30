module Amazonite::SqsV1
  class StartMessageMoveTaskResult
    include JSON::Serializable

    # An identifier associated with a message movement task. You can use this identifier to cancel a
    # specified message movement task using the `CancelMessageMoveTask` action.
    @[JSON::Field(key: "TaskHandle")]
    property task_handle : String | Nil

    def initialize(
      @task_handle : String | Nil = nil,
    )
    end

    def_equals_and_hash(@task_handle)
  end
end
