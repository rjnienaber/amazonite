private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Amazon S3 Select is no longer available to new customers. Existing customers of Amazon S3 Select
  # can continue to use the feature as usual. [Learn
  # more](http://aws.amazon.com/blogs/storage/how-to-optimize-querying-your-data-in-amazon-s3/)
  #
  # Describes the parameters for Select job types.
  #
  # Learn [How to optimize querying your data in Amazon
  # S3](http://aws.amazon.com/blogs/storage/how-to-optimize-querying-your-data-in-amazon-s3/) using
  # [Amazon Athena](https://docs.aws.amazon.com/athena/latest/ug/what-is.html), [S3 Object
  # Lambda](https://docs.aws.amazon.com/AmazonS3/latest/userguide/transforming-objects.html), or
  # client-side filtering.
  class SelectParameters
    # Describes the serialization format of the object.
    property input_serialization : InputSerialization

    # The type of the provided expression (for example, SQL).
    property expression_type : ExpressionType

    # Amazon S3 Select is no longer available to new customers. Existing customers of Amazon S3 Select
    # can continue to use the feature as usual. [Learn
    # more](http://aws.amazon.com/blogs/storage/how-to-optimize-querying-your-data-in-amazon-s3/)
    #
    # The expression that is used to query the object.
    property expression : String

    # Describes how the results of the Select job are serialized.
    property output_serialization : OutputSerialization

    def initialize(
      @input_serialization : InputSerialization,
      @expression_type : ExpressionType,
      @expression : String,
      @output_serialization : OutputSerialization,
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
      xml.element("InputSerialization") { @input_serialization.build_xml(xml) }

      xml.element("ExpressionType") { xml.text @expression_type.to_json_object_key }

      xml.element("Expression") { xml.text @expression }

      xml.element("OutputSerialization") { @output_serialization.build_xml(xml) }
    end

    def self.from_xml(node : XML::Node) : self
      new(
        input_serialization: node.xpath_node("*[local-name()='InputSerialization']").try { |n| InputSerialization.from_xml(n) }.not_nil!,
        expression_type: ((n = node.xpath_node("*[local-name()='ExpressionType']")) ? AS::ExpressionType.from_json_object_key?(n.content) : nil).not_nil!,
        expression: Core::XMLValue.string(node.xpath_node("*[local-name()='Expression']")).not_nil!,
        output_serialization: node.xpath_node("*[local-name()='OutputSerialization']").try { |n| OutputSerialization.from_xml(n) }.not_nil!,
      )
    end

    def validate! : Nil
      if value = @input_serialization
        value.validate!
      end

      if value = @output_serialization
        value.validate!
      end
    end

    def_equals_and_hash(@input_serialization, @expression_type, @expression, @output_serialization)
  end
end
