private alias Core = Amazonite::Core

module Amazonite::S3
  # A container for specifying the notification configuration of the bucket. If this element is
  # empty, notifications are turned off for the bucket.
  class NotificationConfiguration
    # The topic to which notifications are sent and the events for which notifications are generated.
    property topic_configurations : Array(TopicConfiguration) | Nil

    # The Amazon Simple Queue Service queues to publish messages to and the events for which to
    # publish messages.
    property queue_configurations : Array(QueueConfiguration) | Nil

    # Describes the Lambda functions to invoke and the events for which to invoke them.
    property lambda_function_configurations : Array(LambdaFunctionConfiguration) | Nil

    # Enables delivery of events to Amazon EventBridge.
    property event_bridge_configuration : EventBridgeConfiguration | Nil

    def initialize(
      @topic_configurations : Array(TopicConfiguration) | Nil = nil,
      @queue_configurations : Array(QueueConfiguration) | Nil = nil,
      @lambda_function_configurations : Array(LambdaFunctionConfiguration) | Nil = nil,
      @event_bridge_configuration : EventBridgeConfiguration | Nil = nil,
    )
    end

    # `root` is the element this shape is serialized under, which restXml
    # takes from the member binding it as the request payload rather than
    # from the shape's own name - they differ often enough (S3 sends a
    # CompletedMultipartUpload as <CompleteMultipartUpload>) that the caller
    # has to supply it.
    def to_xml(root : String) : String
      XML.build(indent: nil) do |xml|
        xml.element(root) { build_xml(xml) }
      end
    end

    def build_xml(xml : XML::Builder) : Nil
      (@topic_configurations || [] of TopicConfiguration).each do |item|
        xml.element("TopicConfiguration") { item.build_xml(xml) }
      end

      (@queue_configurations || [] of QueueConfiguration).each do |item|
        xml.element("QueueConfiguration") { item.build_xml(xml) }
      end

      (@lambda_function_configurations || [] of LambdaFunctionConfiguration).each do |item|
        xml.element("CloudFunctionConfiguration") { item.build_xml(xml) }
      end

      if value = @event_bridge_configuration
        xml.element("EventBridgeConfiguration") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        topic_configurations: node.xpath_nodes("*[local-name()='TopicConfiguration']").map { |n| TopicConfiguration.from_xml(n) },
        queue_configurations: node.xpath_nodes("*[local-name()='QueueConfiguration']").map { |n| QueueConfiguration.from_xml(n) },
        lambda_function_configurations: node.xpath_nodes("*[local-name()='CloudFunctionConfiguration']").map { |n| LambdaFunctionConfiguration.from_xml(n) },
        event_bridge_configuration: node.xpath_node("*[local-name()='EventBridgeConfiguration']").try { |n| EventBridgeConfiguration.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @topic_configurations
        value.each(&.validate!)
      end

      if value = @queue_configurations
        value.each(&.validate!)
      end

      if value = @lambda_function_configurations
        value.each(&.validate!)
      end

      if value = @event_bridge_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@topic_configurations, @queue_configurations, @lambda_function_configurations, @event_bridge_configuration)
  end
end
