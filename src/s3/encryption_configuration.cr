private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies encryption-related information for an Amazon S3 bucket that is a destination for
  # replicated objects.
  #
  # If you're specifying a customer managed KMS key, we recommend using a fully qualified KMS key
  # ARN. If you use a KMS key alias instead, then KMS resolves the key within the requester’s
  # account. This behavior can result in data that's encrypted with a KMS key that belongs to the
  # requester, and not the bucket owner.
  class EncryptionConfiguration
    # Specifies the ID (Key ARN or Alias ARN) of the customer managed Amazon Web Services KMS key
    # stored in Amazon Web Services Key Management Service (KMS) for the destination bucket. Amazon S3
    # uses this key to encrypt replica objects. Amazon S3 only supports symmetric encryption KMS keys.
    # For more information, see [Asymmetric keys in Amazon Web Services
    # KMS](https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html) in the
    # *Amazon Web Services Key Management Service Developer Guide*.
    property replica_kms_key_id : String | Nil

    def initialize(
      @replica_kms_key_id : String | Nil = nil,
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
      if value = @replica_kms_key_id
        xml.element("ReplicaKmsKeyID") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        replica_kms_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ReplicaKmsKeyID']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@replica_kms_key_id)
  end
end
