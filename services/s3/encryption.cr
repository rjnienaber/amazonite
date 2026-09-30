private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Contains the type of server-side encryption used.
  class Encryption
    # The server-side encryption algorithm used when storing job results in Amazon S3 (for example,
    # AES256, `aws:kms`).
    property encryption_type : ServerSideEncryption

    # If the encryption type is `aws:kms`, this optional value specifies the ID of the symmetric
    # encryption customer managed key to use for encryption of job results. Amazon S3 only supports
    # symmetric encryption KMS keys. For more information, see [Asymmetric keys in
    # KMS](https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html) in the
    # *Amazon Web Services Key Management Service Developer Guide*.
    property kms_key_id : String | Nil

    # If the encryption type is `aws:kms`, this optional value can be used to specify the encryption
    # context for the restore results.
    property kms_context : String | Nil

    def initialize(
      @encryption_type : ServerSideEncryption,
      @kms_key_id : String | Nil = nil,
      @kms_context : String | Nil = nil,
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
      xml.element("EncryptionType") { xml.text @encryption_type.to_json_object_key }

      if value = @kms_key_id
        xml.element("KMSKeyId") { xml.text value }
      end

      if value = @kms_context
        xml.element("KMSContext") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        encryption_type: ((n = node.xpath_node("*[local-name()='EncryptionType']")) ? AS::ServerSideEncryption.from_json_object_key?(n.content) : nil).not_nil!,
        kms_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='KMSKeyId']")),
        kms_context: Core::XMLValue.string(node.xpath_node("*[local-name()='KMSContext']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@encryption_type, @kms_key_id, @kms_context)
  end
end
