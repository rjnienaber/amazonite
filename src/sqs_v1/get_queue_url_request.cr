module Amazonite::SqsV1
  class GetQueueUrlRequest
    include JSON::Serializable

    @[JSON::Field(key: "QueueName")]
    property queue_name : String

    @[JSON::Field(key: "QueueOwnerAWSAccountId")]
    property queue_owner_aws_account_id : String | Nil

    def initialize(
      @queue_name : String,
      @queue_owner_aws_account_id : String | Nil = nil,
    )
    end
  end
end
