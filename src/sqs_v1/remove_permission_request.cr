module Amazonite::SqsV1
  class RemovePermissionRequest
    include JSON::Serializable

    # The URL of the Amazon SQS queue from which permissions are removed.
    #
    # Queue URLs and names are case-sensitive.
    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    # The identification of the permission to remove. This is the label added using the `
    # AddPermission ` action.
    @[JSON::Field(key: "Label")]
    property label : String

    def initialize(
      @queue_url : String,
      @label : String,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@queue_url, @label)
  end
end
