private alias Core = Amazonite::Core

module Amazonite::S3
  # Container element that identifies who initiated the multipart upload.
  class Initiator
    # If the principal is an Amazon Web Services account, it provides the Canonical User ID. If the
    # principal is an IAM User, it provides a user ARN value.
    #
    # **Directory buckets** - If the principal is an Amazon Web Services account, it provides the
    # Amazon Web Services account ID. If the principal is an IAM User, it provides a user ARN value.
    property id : String | Nil

    # This functionality is not supported for directory buckets.
    property display_name : String | Nil

    def initialize(
      @id : String | Nil = nil,
      @display_name : String | Nil = nil,
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
        xml.element("ID") { xml.text value }
      end

      if value = @display_name
        xml.element("DisplayName") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        id: Core::XMLValue.string(node.xpath_node("*[local-name()='ID']")),
        display_name: Core::XMLValue.string(node.xpath_node("*[local-name()='DisplayName']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@id, @display_name)
  end
end
