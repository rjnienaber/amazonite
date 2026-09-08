private alias AS = Amazonite::S3

module Amazonite::S3
  # A filter that you can specify for selection for modifications on replicas. Amazon S3 doesn't
  # replicate replica modifications by default. In the latest version of replication configuration
  # (when `Filter` is specified), you can specify this element and set the status to `Enabled` to
  # replicate modifications on replicas.
  #
  # If you don't specify the `Filter` element, Amazon S3 assumes that the replication configuration
  # is the earlier version, V1. In the earlier version, this element is not allowed.
  class ReplicaModifications
    # Specifies whether Amazon S3 replicates modifications on replicas.
    property status : ReplicaModificationsStatus

    def initialize(
      @status : ReplicaModificationsStatus,
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
        status: ((n = node.xpath_node("*[local-name()='Status']")) ? AS::ReplicaModificationsStatus.from_json_object_key?(n.content) : nil).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@status)
  end
end
