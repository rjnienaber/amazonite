private alias AS = Amazonite::S3

module Amazonite::S3
  # A container for filter information for the selection of S3 objects encrypted with Amazon Web
  # Services KMS.
  class SseKmsEncryptedObjects
    # Specifies whether Amazon S3 replicates objects created with server-side encryption using an
    # Amazon Web Services KMS key stored in Amazon Web Services Key Management Service.
    property status : SseKmsEncryptedObjectsStatus

    def initialize(
      @status : SseKmsEncryptedObjectsStatus,
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
      xml.element("Status") { xml.text @status.to_json_object_key }
    end

    def self.from_xml(node : XML::Node) : self
      new(
        status: ((n = node.xpath_node("*[local-name()='Status']")) ? AS::SseKmsEncryptedObjectsStatus.from_json_object_key?(n.content) : nil).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@status)
  end
end
