private alias Core = Amazonite::Core

module Amazonite::S3
  # A container that describes additional filters for identifying the source objects that you want
  # to replicate. You can choose to enable or disable the replication of these objects. Currently,
  # Amazon S3 supports only the filter that you can specify for objects created with server-side
  # encryption using a customer managed key stored in Amazon Web Services Key Management Service
  # (SSE-KMS).
  class SourceSelectionCriteria
    # A container for filter information for the selection of Amazon S3 objects encrypted with Amazon
    # Web Services KMS. If you include `SourceSelectionCriteria` in the replication configuration,
    # this element is required.
    property sse_kms_encrypted_objects : SseKmsEncryptedObjects | Nil

    # A filter that you can specify for selections for modifications on replicas. Amazon S3 doesn't
    # replicate replica modifications by default. In the latest version of replication configuration
    # (when `Filter` is specified), you can specify this element and set the status to `Enabled` to
    # replicate modifications on replicas.
    #
    # If you don't specify the `Filter` element, Amazon S3 assumes that the replication configuration
    # is the earlier version, V1. In the earlier version, this element is not allowed
    property replica_modifications : ReplicaModifications | Nil

    def initialize(
      @sse_kms_encrypted_objects : SseKmsEncryptedObjects | Nil = nil,
      @replica_modifications : ReplicaModifications | Nil = nil,
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
      if value = @sse_kms_encrypted_objects
        xml.element("SseKmsEncryptedObjects") { value.build_xml(xml) }
      end

      if value = @replica_modifications
        xml.element("ReplicaModifications") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        sse_kms_encrypted_objects: node.xpath_node("*[local-name()='SseKmsEncryptedObjects']").try { |n| SseKmsEncryptedObjects.from_xml(n) },
        replica_modifications: node.xpath_node("*[local-name()='ReplicaModifications']").try { |n| ReplicaModifications.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @sse_kms_encrypted_objects
        value.validate!
      end

      if value = @replica_modifications
        value.validate!
      end
    end

    def_equals_and_hash(@sse_kms_encrypted_objects, @replica_modifications)
  end
end
