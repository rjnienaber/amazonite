private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Container for granting information.
  #
  # Buckets that use the bucket owner enforced setting for Object Ownership don't support target
  # grants. For more information, see [Permissions server access log
  # delivery](https://docs.aws.amazon.com/AmazonS3/latest/userguide/enable-server-access-logging.html#grant-log-delivery-permissions-general)
  # in the *Amazon S3 User Guide*.
  class TargetGrant
    # Container for the person being granted permissions.
    property grantee : Grantee | Nil

    # Logging permissions assigned to the grantee for the bucket.
    property permission : BucketLogsPermission | Nil

    def initialize(
      @grantee : Grantee | Nil = nil,
      @permission : BucketLogsPermission | Nil = nil,
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
      if value = @grantee
        xml.element("Grantee") { value.build_xml(xml) }
      end

      if value = @permission
        xml.element("Permission") { xml.text value.to_json_object_key }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        grantee: node.xpath_node("*[local-name()='Grantee']").try { |n| Grantee.from_xml(n) },
        permission: (n = node.xpath_node("*[local-name()='Permission']")) ? AS::BucketLogsPermission.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @grantee
        value.validate!
      end
    end

    def_equals_and_hash(@grantee, @permission)
  end
end
