private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # A container for specifying the configuration for Lambda notifications.
  class LambdaFunctionConfiguration
    property id : String | Nil

    # The Amazon Resource Name (ARN) of the Lambda function that Amazon S3 invokes when the specified
    # event type occurs.
    property lambda_function_arn : String

    # The Amazon S3 bucket event for which to invoke the Lambda function. For more information, see
    # [Supported Event Types](https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html)
    # in the *Amazon S3 User Guide*.
    property events : Array(Event) = [] of Event

    property filter : NotificationConfigurationFilter | Nil

    def initialize(
      @lambda_function_arn : String,
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

      xml.element("CloudFunction") { xml.text @lambda_function_arn }

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
        lambda_function_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='CloudFunction']")).not_nil!,
        events: node.xpath_nodes("*[local-name()='Event']").compact_map { |n| AS::Event.from_json_object_key?(n.content) },
        filter: node.xpath_node("*[local-name()='Filter']").try { |n| NotificationConfigurationFilter.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @filter
        value.validate!
      end
    end

    def_equals_and_hash(@id, @lambda_function_arn, @events, @filter)
  end
end
