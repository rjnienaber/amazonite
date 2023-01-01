module Amazonite::SsmV1
  class ScheduledWindowExecution
    include JSON::Serializable

    @[JSON::Field(key: "WindowId")]
    property window_id : String | Nil

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "ExecutionTime")]
    property execution_time : String | Nil

    def initialize(
      @window_id : String | Nil = nil,
      @name : String | Nil = nil,
      @execution_time : String | Nil = nil
    )
    end
  end
end
