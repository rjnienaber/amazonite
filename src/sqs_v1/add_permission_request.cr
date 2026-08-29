module Amazonite::SqsV1
  class AddPermissionRequest
    include JSON::Serializable

    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    @[JSON::Field(key: "Label")]
    property label : String

    @[JSON::Field(key: "AWSAccountIds")]
    property aws_account_ids : Array(String) = [] of String

    @[JSON::Field(key: "Actions")]
    property actions : Array(String) = [] of String

    def initialize(
      @queue_url : String,
      @label : String,
      @aws_account_ids : Array(String),
      @actions : Array(String),
    )
    end
  end
end
