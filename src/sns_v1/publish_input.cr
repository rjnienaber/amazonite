private alias Core = Amazonite::Core

module Amazonite::SnsV1
  # Input for Publish action.
  class PublishInput
    # The topic you want to publish to.
    #
    # If you don't specify a value for the `TopicArn` parameter, you must specify a value for the
    # `PhoneNumber` or `TargetArn` parameters.
    property topic_arn : String | Nil

    # If you don't specify a value for the `TargetArn` parameter, you must specify a value for the
    # `PhoneNumber` or `TopicArn` parameters.
    property target_arn : String | Nil

    # The phone number to which you want to deliver an SMS message. Use E.164 format.
    #
    # If you don't specify a value for the `PhoneNumber` parameter, you must specify a value for the
    # `TargetArn` or `TopicArn` parameters.
    property phone_number : String | Nil

    # The message you want to send.
    #
    # If you are publishing to a topic and you want to send the same message to all transport
    # protocols, include the text of the message as a String value. If you want to send different
    # messages for each transport protocol, set the value of the `MessageStructure` parameter to
    # `json` and use a JSON object for the `Message` parameter.
    #
    # Constraints:
    #
    # - With the exception of SMS, messages must be UTF-8 encoded strings and at most 256 KB in size
    # (262,144 bytes, not 262,144 characters).
    #
    # - For SMS, each message can contain up to 140 characters. This character limit depends on the
    # encoding schema. For example, an SMS message can contain 160 GSM characters, 140 ASCII
    # characters, or 70 UCS-2 characters.
    #
    # If you publish a message that exceeds this size limit, Amazon SNS sends the message as multiple
    # messages, each fitting within the size limit. Messages aren't truncated mid-word but are cut off
    # at whole-word boundaries.
    #
    # The total size limit for a single SMS `Publish` action is 1,600 characters.
    #
    # JSON-specific constraints:
    #
    # - Keys in the JSON object that correspond to supported transport protocols must have simple JSON
    # string values.
    #
    # - The values will be parsed (unescaped) before they are used in outgoing messages.
    #
    # - Outbound notifications are JSON encoded (meaning that the characters will be reescaped for
    # sending).
    #
    # - Values have a minimum length of 0 (the empty string, "", is allowed).
    #
    # - Values have a maximum length bounded by the overall message size (so, including multiple
    # protocols may limit message sizes).
    #
    # - Non-string values will cause the key to be ignored.
    #
    # - Keys that do not correspond to supported transport protocols are ignored.
    #
    # - Duplicate keys are not allowed.
    #
    # - Failure to parse or validate any key or value in the message will cause the `Publish` call to
    # return an error (no partial delivery).
    property message : String

    # Optional parameter to be used as the "Subject" line when the message is delivered to email
    # endpoints. This field will also be included, if present, in the standard JSON messages delivered
    # to other endpoints.
    #
    # Constraints: Subjects must be UTF-8 text with no line breaks or control characters, and less
    # than 100 characters long.
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
    # transport protocol (e.g., "http").
    #
    # Valid value: `json`
    property message_structure : String | Nil

    # Message attributes for Publish action.
    property message_attributes : Hash(String, MessageAttributeValue) | Nil

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
    # - Every message must have a unique `MessageDeduplicationId`:
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
    property message_deduplication_id : String | Nil

    # The `MessageGroupId` can contain up to 128 alphanumeric characters `(a-z, A-Z, 0-9)` and
    # punctuation `(!"#$%&'()*+,-./:;?@[\]^_`{|}~)`.
    #
    # For FIFO topics: The `MessageGroupId` is a tag that specifies that a message belongs to a
    # specific message group. Messages that belong to the same message group are processed in a FIFO
    # manner (however, messages in different message groups might be processed out of order). Every
    # message must include a `MessageGroupId`.
    #
    # For standard topics: The `MessageGroupId` is optional and is forwarded only to Amazon SQS
    # standard subscriptions to activate [fair
    # queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-fair-queues.html).
    # The `MessageGroupId` is not used for, or sent to, any other endpoint types. When provided, the
    # same validation rules apply as for FIFO topics.
    property message_group_id : String | Nil

    def initialize(
      @message : String,
      @topic_arn : String | Nil = nil,
      @target_arn : String | Nil = nil,
      @phone_number : String | Nil = nil,
      @subject : String | Nil = nil,
      @message_structure : String | Nil = nil,
      @message_attributes : Hash(String, MessageAttributeValue) | Nil = nil,
      @message_deduplication_id : String | Nil = nil,
      @message_group_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @topic_arn
        params << {"#{prefix}TopicArn", value}
      end

      if value = @target_arn
        params << {"#{prefix}TargetArn", value}
      end

      if value = @phone_number
        params << {"#{prefix}PhoneNumber", value}
      end

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
        topic_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TopicArn']")),
        target_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TargetArn']")),
        phone_number: Core::XMLValue.string(node.xpath_node("*[local-name()='PhoneNumber']")),
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
