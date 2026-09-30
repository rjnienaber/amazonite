private alias Core = Amazonite::Core

module Amazonite::S3
  # Describes where logs are stored and the prefix that Amazon S3 assigns to all log object keys for
  # a bucket. For more information, see [PUT Bucket
  # logging](https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTlogging.html) in the
  # *Amazon S3 API Reference*.
  class LoggingEnabled
    # Specifies the bucket where you want Amazon S3 to store server access logs. You can have your
    # logs delivered to any bucket that you own, including the same bucket that is being logged. You
    # can also configure multiple buckets to deliver their logs to the same target bucket. In this
    # case, you should choose a different `TargetPrefix` for each source bucket so that the delivered
    # log files can be distinguished by key.
    property target_bucket : String

    # Container for granting information.
    #
    # Buckets that use the bucket owner enforced setting for Object Ownership don't support target
    # grants. For more information, see [Permissions for server access log
    # delivery](https://docs.aws.amazon.com/AmazonS3/latest/userguide/enable-server-access-logging.html#grant-log-delivery-permissions-general)
    # in the *Amazon S3 User Guide*.
    property target_grants : Array(TargetGrant) | Nil

    # A prefix for all log object keys. If you store log files from multiple Amazon S3 buckets in a
    # single bucket, you can use a prefix to distinguish which log files came from which bucket.
    property target_prefix : String

    # Amazon S3 key format for log objects.
    property target_object_key_format : TargetObjectKeyFormat | Nil

    def initialize(
      @target_bucket : String,
      @target_prefix : String,
      @target_grants : Array(TargetGrant) | Nil = nil,
      @target_object_key_format : TargetObjectKeyFormat | Nil = nil,
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
      xml.element("TargetBucket") { xml.text @target_bucket }

      xml.element("TargetGrants") do
        (@target_grants || [] of TargetGrant).each do |item|
          xml.element("Grant") { item.build_xml(xml) }
        end
      end

      xml.element("TargetPrefix") { xml.text @target_prefix }

      if value = @target_object_key_format
        xml.element("TargetObjectKeyFormat") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        target_bucket: Core::XMLValue.string(node.xpath_node("*[local-name()='TargetBucket']")).not_nil!,
        target_grants: node.xpath_nodes("*[local-name()='TargetGrants']/*[local-name()='Grant']").map { |n| TargetGrant.from_xml(n) },
        target_prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='TargetPrefix']")).not_nil!,
        target_object_key_format: node.xpath_node("*[local-name()='TargetObjectKeyFormat']").try { |n| TargetObjectKeyFormat.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @target_grants
        value.each(&.validate!)
      end

      if value = @target_object_key_format
        value.validate!
      end
    end

    def_equals_and_hash(@target_bucket, @target_grants, @target_prefix, @target_object_key_format)
  end
end
