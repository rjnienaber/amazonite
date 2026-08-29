module Amazonite::SqsV1
  class StartMessageMoveTaskResult
    include JSON::Serializable

    @[JSON::Field(key: "TaskHandle")]
    property task_handle : String | Nil

    def initialize(
      @task_handle : String | Nil = nil,
    )
    end
  end
end
