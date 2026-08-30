private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  # Reserved.
  class QueryCompileError
    include JSON::Serializable

    # Reserved.
    @[JSON::Field(key: "location")]
    property location : QueryCompileErrorLocation | Nil

    # Reserved.
    @[JSON::Field(key: "message")]
    property message : String | Nil

    def initialize(
      @location : QueryCompileErrorLocation | Nil = nil,
      @message : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @location
        value.validate!
      end
    end

    def_equals_and_hash(@location, @message)
  end
end
