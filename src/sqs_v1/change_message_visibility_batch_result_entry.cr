module Amazonite::SqsV1
  class ChangeMessageVisibilityBatchResultEntry
    include JSON::Serializable

    @[JSON::Field(key: "Id")]
    property id : String

    def initialize(
      @id : String,
    )
    end
  end
end
