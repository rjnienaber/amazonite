private alias Core = Amazonite::Core

module Amazonite::Sns
  class PublishBatchInput
    # The Amazon resource name (ARN) of the topic you want to batch publish to.
    property topic_arn : String

    # A list of `PublishBatch` request entries to be sent to the SNS topic.
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

    def validate! : Nil
      if value = @publish_batch_request_entries
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@topic_arn, @publish_batch_request_entries)
  end
end
