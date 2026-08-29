private alias Core = Amazonite::Core

module Amazonite::SnsV1
  # Contains the details of a single Amazon SNS message along with an `Id` that identifies a message
  # within the batch.
  class PublishBatchRequestEntry
    # An identifier for the message in this batch.
    #
    # The `Ids` of a batch request must be unique within a request.
    #
    # This identifier can have up to 80 characters. The following characters are accepted:
    # alphanumeric characters, hyphens(-), and underscores (_).
    property id : String

    # The body of the message.
    property message : String

    # The subject of the batch message.
    property subject : String | Nil

    # Set `MessageStructure` to `json` if you want to send a different message for each protocol. For
    # example, using one publish action, you can send a short message to your SMS subscribers and a
    # longer message to your email subscribers. If you set `MessageStructure` to `json`, the value of
    # the `Message` parameter must:
    #
    # - be a syntactically valid JSON object; and
    #
    # - contain at least a top-level JSON key of "default" with a value that is a string.
    #
    # You can define other top-level keys that define the message you want to send to a specific
    # transport protocol (for example, http).
    property message_structure : String | Nil

    # Each message attribute consists of a `Name`, `Type`, and `Value`. For more information, see
    # [Amazon SNS message
    # attributes](https://docs.aws.amazon.com/sns/latest/dg/sns-message-attributes.html) in the Amazon
    # SNS Developer Guide.
    property message_attributes : Hash(String, MessageAttributeValue) | Nil

    # This parameter applies only to FIFO (first-in-first-out) topics.
    #
    # - This parameter applies only to FIFO (first-in-first-out) topics. The `MessageDeduplicationId`
    # can contain up to 128 alphanumeric characters `(a-z, A-Z, 0-9)` and punctuation
    # `(!"#$%&'()*+,-./:;?@[\]^_`{|}~)`.
    #
    # - Every message must have a unique `MessageDeduplicationId`, which is a token used for
    # deduplication of sent messages within the 5 minute minimum deduplication interval.
    #
    # - The scope of deduplication depends on the `FifoThroughputScope` attribute, when set to `Topic`
    # the message deduplication scope is across the entire topic, when set to `MessageGroup` the
    # message deduplication scope is within each individual message group.
    #
    # - If a message with a particular `MessageDeduplicationId` is sent successfully, subsequent
    # messages within the deduplication scope and interval, with the same `MessageDeduplicationId`,
    # are accepted successfully but aren't delivered.
    #
    # - Every message must have a unique `MessageDeduplicationId`.
    #
    # - You may provide a `MessageDeduplicationId` explicitly.
    #
    # - If you aren't able to provide a `MessageDeduplicationId` and you enable
    # `ContentBasedDeduplication` for your topic, Amazon SNS uses a SHA-256 hash to generate the
    # `MessageDeduplicationId` using the body of the message (but not the attributes of the message).
    #
    # - If you don't provide a `MessageDeduplicationId` and the topic doesn't have
    # `ContentBasedDeduplication` set, the action fails with an error.
    #
    # - If the topic has a `ContentBasedDeduplication` set, your `MessageDeduplicationId` overrides
    # the generated one.
    #
    # - When `ContentBasedDeduplication` is in effect, messages with identical content sent within the
    # deduplication scope and interval are treated as duplicates and only one copy of the message is
    # delivered.
    #
    # - If you send one message with `ContentBasedDeduplication` enabled, and then another message
    # with a `MessageDeduplicationId` that is the same as the one generated for the first
    # `MessageDeduplicationId`, the two messages are treated as duplicates, within the deduplication
    # scope and interval, and only one copy of the message is delivered.
    #
    # The `MessageDeduplicationId` is available to the consumer of the message (this can be useful for
    # troubleshooting delivery issues).
    #
    # If a message is sent successfully but the acknowledgement is lost and the message is resent with
    # the same `MessageDeduplicationId` after the deduplication interval, Amazon SNS can't detect
    # duplicate messages.
    #
    # Amazon SNS continues to keep track of the message deduplication ID even after the message is
    # received and deleted.
    property message_deduplication_id : String | Nil

    # FIFO topics: The tag that specifies that a message belongs to a specific message group. Messages
    # that belong to the same message group are processed in a FIFO manner (however, messages in
    # different message groups might be processed out of order). To interleave multiple ordered
    # streams within a single topic, use `MessageGroupId` values (for example, session data for
    # multiple users). In this scenario, multiple consumers can process the topic, but the session
    # data of each user is processed in a FIFO fashion. You must associate a non-empty
    # `MessageGroupId` with a message. If you do not provide a `MessageGroupId`, the action fails.
    #
    # Standard topics: The `MessageGroupId` is optional and is forwarded only to Amazon SQS standard
    # subscriptions to activate [fair
    # queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-fair-queues.html).
    # The `MessageGroupId` is not used for, or sent to, any other endpoint types.
    #
    # The length of `MessageGroupId` is 128 characters.
    #
    # `MessageGroupId` can contain alphanumeric characters `(a-z, A-Z, 0-9)` and punctuation
    # `(!"#$%&'()*+,-./:;?@[\]^_`{|}~)`.
    property message_group_id : String | Nil

    def initialize(
      @id : String,
      @message : String,
      @subject : String | Nil = nil,
      @message_structure : String | Nil = nil,
      @message_attributes : Hash(String, MessageAttributeValue) | Nil = nil,
      @message_deduplication_id : String | Nil = nil,
      @message_group_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Id", @id}

      params << {"#{prefix}Message", @message}

      if value = @subject
        params << {"#{prefix}Subject", value}
      end

      if value = @message_structure
        params << {"#{prefix}MessageStructure", value}
      end

      (@message_attributes || {} of String => MessageAttributeValue).each_with_index(1) do |(key, value), i|
        params << {"#{prefix}MessageAttributes.entry.#{i}.Name", key}
        params.concat(value.to_query_params("#{prefix}MessageAttributes.entry.#{i}.Value."))
      end

      if value = @message_deduplication_id
        params << {"#{prefix}MessageDeduplicationId", value}
      end

      if value = @message_group_id
        params << {"#{prefix}MessageGroupId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        id: Core::XMLValue.string(node.xpath_node("*[local-name()='Id']")).not_nil!,
        message: Core::XMLValue.string(node.xpath_node("*[local-name()='Message']")).not_nil!,
        subject: Core::XMLValue.string(node.xpath_node("*[local-name()='Subject']")),
        message_structure: Core::XMLValue.string(node.xpath_node("*[local-name()='MessageStructure']")),
        message_attributes: node.xpath_nodes("*[local-name()='MessageAttributes']/*[local-name()='entry']").each_with_object({} of String => MessageAttributeValue) { |entry, hash| hash[entry.xpath_node("*[local-name()='Name']").not_nil!.content] = MessageAttributeValue.from_xml(entry.xpath_node("*[local-name()='Value']").not_nil!) },
        message_deduplication_id: Core::XMLValue.string(node.xpath_node("*[local-name()='MessageDeduplicationId']")),
        message_group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='MessageGroupId']")),
      )
    end
  end
end
