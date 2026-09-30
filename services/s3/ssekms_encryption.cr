private alias Core = Amazonite::Core

module Amazonite::S3
  # If `SSEKMS` is specified for `ObjectEncryption`, this data type specifies the Amazon Web
  # Services KMS key Amazon Resource Name (ARN) to use and whether to use an S3 Bucket Key for
  # server-side encryption using Key Management Service (KMS) keys (SSE-KMS).
  class SSEKMSEncryption
    # Specifies the Amazon Web Services KMS key Amazon Resource Name (ARN) to use for the updated
    # server-side encryption type. Required if `ObjectEncryption` specifies `SSEKMS`.
    #
    # You must specify the full Amazon Web Services KMS key ARN. The KMS key ID and KMS key alias
    # aren't supported.
    #
    # Pattern: (`arn:aws[-a-z0-9]*:kms:[-a-z0-9]*:[0-9]{12}:key/.+`)
    property kms_key_arn : String

    # Specifies whether Amazon S3 should use an S3 Bucket Key for object encryption with server-side
    # encryption using Key Management Service (KMS) keys (SSE-KMS). If this value isn't specified, it
    # defaults to `false`. Setting this value to `true` causes Amazon S3 to use an S3 Bucket Key for
    # object encryption with SSE-KMS. For more information, see [ Using Amazon S3 Bucket
    # Keys](https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucket-key.html) in the *Amazon S3
    # User Guide*.
    #
    # Valid Values: `true` | `false`
    property bucket_key_enabled : Bool | Nil

    def initialize(
      @kms_key_arn : String,
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
      xml.element("KMSKeyArn") { xml.text @kms_key_arn }

      if value = @bucket_key_enabled
        xml.element("BucketKeyEnabled") { xml.text Core::QueryValue.bool(value) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        kms_key_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='KMSKeyArn']")).not_nil!,
        bucket_key_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='BucketKeyEnabled']")),
      )
    end

    def validate! : Nil
      if value = @kms_key_arn
        raise Core::ValidationError.new("KMSKeyArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("KMSKeyArn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("KMSKeyArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[a-zA-Z0-9-]*:kms:[a-z0-9-]+:[0-9]{12}:key/[a-zA-Z0-9-]+$"))
      end
    end

    def_equals_and_hash(@kms_key_arn, @bucket_key_enabled)
  end
end
