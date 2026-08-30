module Amazonite::SqsV1
  class AddPermissionRequest
    include JSON::Serializable

    # The URL of the Amazon SQS queue to which permissions are added.
    #
    # Queue URLs and names are case-sensitive.
    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    # The unique identification of the permission you're setting (for example, `AliceSendMessage`).
    # Maximum 80 characters. Allowed characters include alphanumeric characters, hyphens (`-`), and
    # underscores (`_`).
    @[JSON::Field(key: "Label")]
    property label : String

    # The Amazon Web Services account numbers of the
    # [principals](https://docs.aws.amazon.com/general/latest/gr/glos-chap.html#P) who are to receive
    # permission. For information about locating the Amazon Web Services account identification, see
    # [Your Amazon Web Services
    # Identifiers](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-making-api-requests.html#sqs-api-request-authentication)
    # in the *Amazon SQS Developer Guide*.
    @[JSON::Field(key: "AWSAccountIds")]
    property aws_account_ids : Array(String) = [] of String

    # The action the client wants to allow for the specified principal. Valid values: the name of any
    # action or `*`.
    #
    # For more information about these actions, see [Overview of Managing Access Permissions to Your
    # Amazon Simple Queue Service
    # Resource](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-overview-of-managing-access.html)
    # in the *Amazon SQS Developer Guide*.
    #
    # Specifying `SendMessage`, `DeleteMessage`, or `ChangeMessageVisibility` for `ActionName.n` also
    # grants permissions for the corresponding batch versions of those actions: `SendMessageBatch`,
    # `DeleteMessageBatch`, and `ChangeMessageVisibilityBatch`.
    @[JSON::Field(key: "Actions")]
    property actions : Array(String) = [] of String

    def initialize(
      @queue_url : String,
      @label : String,
      @aws_account_ids : Array(String),
      @actions : Array(String),
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@queue_url, @label, @aws_account_ids, @actions)
  end
end
