private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies object key name filtering rules. For information about key name filtering, see
  # [Configuring event notifications using object key name
  # filtering](https://docs.aws.amazon.com/AmazonS3/latest/userguide/notification-how-to-filtering.html)
  # in the *Amazon S3 User Guide*.
  class NotificationConfigurationFilter
    property key : S3KeyFilter | Nil

    def initialize(
      @key : S3KeyFilter | Nil = nil,
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
      if value = @key
        xml.element("S3Key") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        key: node.xpath_node("*[local-name()='S3Key']").try { |n| S3KeyFilter.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @key
        value.validate!
      end
    end

    def_equals_and_hash(@key)
  end
end
