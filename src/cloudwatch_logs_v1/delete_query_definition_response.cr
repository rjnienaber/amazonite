module Amazonite::CloudWatchLogsV1
  class DeleteQueryDefinitionResponse
    include JSON::Serializable

    # A value of TRUE indicates that the operation succeeded. FALSE indicates that the operation
    # failed.
    @[JSON::Field(key: "success")]
    property success : Bool | Nil

    def initialize(
      @success : Bool | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@success)
  end
end
