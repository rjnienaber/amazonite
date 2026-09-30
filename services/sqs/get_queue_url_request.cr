module Amazonite::Sqs
  # Retrieves the URL of an existing queue based on its name and, optionally, the Amazon Web
  # Services account ID.
  class GetQueueUrlRequest
    include JSON::Serializable

    # (Required) The name of the queue for which you want to fetch the URL. The name can be up to 80
    # characters long and can include alphanumeric characters, hyphens (-), and underscores (_). Queue
    # URLs and names are case-sensitive.
    @[JSON::Field(key: "QueueName")]
    property queue_name : String

    # (Optional) The Amazon Web Services account ID of the account that created the queue. This is
    # only required when you are attempting to access a queue owned by another Amazon Web Services
    # account.
    @[JSON::Field(key: "QueueOwnerAWSAccountId")]
    property queue_owner_aws_account_id : String | Nil

    def initialize(
      @queue_name : String,
      @queue_owner_aws_account_id : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@queue_name, @queue_owner_aws_account_id)
  end
end
