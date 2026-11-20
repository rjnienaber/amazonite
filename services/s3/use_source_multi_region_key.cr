private alias AS = Amazonite::S3

module Amazonite::S3
  # A container for configuring the use of the related multi-Region KMS key in the destination
  # Amazon Web Services Region for replication.
  class UseSourceMultiRegionKey
    # Specifies whether Amazon S3 uses the related multi-Region KMS key in the destination Amazon Web
    # Services Region to encrypt the replica.
    property status : UseSourceMultiRegionKeyStatus

    def initialize(
      @status : UseSourceMultiRegionKeyStatus,
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
        status: ((n = node.xpath_node("*[local-name()='Status']")) ? AS::UseSourceMultiRegionKeyStatus.from_json_object_key?(n.content) : nil).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@status)
  end
end
