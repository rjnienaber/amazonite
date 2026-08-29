private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class PublishInput
    property topic_arn : String | Nil

    property target_arn : String | Nil

    property phone_number : String | Nil

    property message : String

    property subject : String | Nil

    property message_structure : String | Nil

    property message_attributes : Hash(String, MessageAttributeValue) | Nil

    property message_deduplication_id : String | Nil

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
