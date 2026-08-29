private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class PublishBatchRequestEntry
    property id : String

    property message : String

    property subject : String | Nil

    property message_structure : String | Nil

    property message_attributes : Hash(String, MessageAttributeValue) | Nil

    property message_deduplication_id : String | Nil

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
