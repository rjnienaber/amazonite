private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class PublishBatchInput
    property topic_arn : String

    property publish_batch_request_entries : Array(PublishBatchRequestEntry) = [] of PublishBatchRequestEntry

    def initialize(
      @topic_arn : String,
      @publish_batch_request_entries : Array(PublishBatchRequestEntry),
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TopicArn", @topic_arn}

      @publish_batch_request_entries.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PublishBatchRequestEntries.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        topic_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TopicArn']")).not_nil!,
        publish_batch_request_entries: node.xpath_nodes("*[local-name()='PublishBatchRequestEntries']/*[local-name()='member']").map { |n| PublishBatchRequestEntry.from_xml(n) },
      )
    end
  end
end
