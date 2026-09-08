private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class CreateSessionOutput
    # The server-side encryption algorithm used when you store objects in the directory bucket.
    #
    # When accessing data stored in Amazon FSx file systems using S3 access points, the only valid
    # server side encryption option is `aws:fsx`.
    property server_side_encryption : ServerSideEncryption | Nil

    # If you specify `x-amz-server-side-encryption` with `aws:kms`, this header indicates the ID of
    # the KMS symmetric encryption customer managed key that was used for object encryption.
    property ssekms_key_id : String | Nil

    # If present, indicates the Amazon Web Services KMS Encryption Context to use for object
    # encryption. The value of this header is a Base64 encoded string of a UTF-8 encoded JSON, which
    # contains the encryption context as key-value pairs. This value is stored as object metadata and
    # automatically gets passed on to Amazon Web Services KMS for future `GetObject` operations on
    # this object.
    property ssekms_encryption_context : String | Nil

    # Indicates whether to use an S3 Bucket Key for server-side encryption with KMS keys (SSE-KMS).
    property bucket_key_enabled : Bool | Nil

    # The established temporary security credentials for the created session.
    property credentials : SessionCredentials

    def initialize(
      @credentials : SessionCredentials,
      @server_side_encryption : ServerSideEncryption | Nil = nil,
      @ssekms_key_id : String | Nil = nil,
      @ssekms_encryption_context : String | Nil = nil,
      @bucket_key_enabled : Bool | Nil = nil,
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
      xml.element("Credentials") { @credentials.build_xml(xml) }
    end

    def self.from_xml(node : XML::Node) : self
      new(
        credentials: node.xpath_node("*[local-name()='Credentials']").try { |n| SessionCredentials.from_xml(n) }.not_nil!,
      )
    end

    def validate! : Nil
      if value = @credentials
        value.validate!
      end
    end

    def_equals_and_hash(@server_side_encryption, @ssekms_key_id, @ssekms_encryption_context, @bucket_key_enabled, @credentials)
  end
end
