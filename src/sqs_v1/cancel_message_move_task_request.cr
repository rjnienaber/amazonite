module Amazonite::SqsV1
  class CancelMessageMoveTaskRequest
    include JSON::Serializable

    # An identifier associated with a message movement task.
    @[JSON::Field(key: "TaskHandle")]
    property task_handle : String

    def initialize(
      @task_handle : String,
    )
    end
  end
end
