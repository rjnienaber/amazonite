module Amazonite::SqsV1
  class RemovePermissionRequest
    include JSON::Serializable

    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    @[JSON::Field(key: "Label")]
    property label : String

    def initialize(
      @queue_url : String,
      @label : String,
    )
    end
  end
end
