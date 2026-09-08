private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies the configuration for publishing messages to an Amazon Simple Queue Service (Amazon
  # SQS) queue when Amazon S3 detects specified events.
  class QueueConfiguration
    property id : String | Nil

    # The Amazon Resource Name (ARN) of the Amazon SQS queue to which Amazon S3 publishes a message
    # when it detects events of the specified type.
    property queue_arn : String

    # A collection of bucket events for which to send notifications
    property events : Array(Event) = [] of Event

    property filter : NotificationConfigurationFilter | Nil

    def initialize(
      @queue_arn : String,
      @events : Array(Event),
      @id : String | Nil = nil,
      @filter : NotificationConfigurationFilter | Nil = nil,
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
      if value = @id
        xml.element("Id") { xml.text value }
      end

      xml.element("Queue") { xml.text @queue_arn }

      @events.each do |item|
        xml.element("Event") { xml.text item.to_json_object_key }
      end

      if value = @filter
        xml.element("Filter") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        id: Core::XMLValue.string(node.xpath_node("*[local-name()='Id']")),
        queue_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Queue']")).not_nil!,
        events: node.xpath_nodes("*[local-name()='Event']").compact_map { |n| AS::Event.from_json_object_key?(n.content) },
        filter: node.xpath_node("*[local-name()='Filter']").try { |n| NotificationConfigurationFilter.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @filter
        value.validate!
      end
    end

    def_equals_and_hash(@id, @queue_arn, @events, @filter)
  end
end
