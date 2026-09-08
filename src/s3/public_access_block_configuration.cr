private alias Core = Amazonite::Core

module Amazonite::S3
  # The PublicAccessBlock configuration that you want to apply to this Amazon S3 bucket. You can
  # enable the configuration options in any combination. Bucket-level settings work alongside
  # account-level settings (which may inherit from organization-level policies). For more
  # information about when Amazon S3 considers a bucket or object public, see [The Meaning of
  # "Public"](https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status)
  # in the *Amazon S3 User Guide*.
  class PublicAccessBlockConfiguration
    # Specifies whether Amazon S3 should block public access control lists (ACLs) for this bucket and
    # objects in this bucket. Setting this element to `TRUE` causes the following behavior:
    #
    # - PUT Bucket ACL and PUT Object ACL calls fail if the specified ACL is public.
    #
    # - PUT Object calls fail if the request includes a public ACL.
    #
    # - PUT Bucket calls fail if the request includes a public ACL.
    #
    # Enabling this setting doesn't affect existing policies or ACLs.
    property block_public_acls : Bool | Nil

    # Specifies whether Amazon S3 should ignore public ACLs for this bucket and objects in this
    # bucket. Setting this element to `TRUE` causes Amazon S3 to ignore all public ACLs on this bucket
    # and objects in this bucket.
    #
    # Enabling this setting doesn't affect the persistence of any existing ACLs and doesn't prevent
    # new public ACLs from being set.
    property ignore_public_acls : Bool | Nil

    # Specifies whether Amazon S3 should block public bucket policies for this bucket. Setting this
    # element to `TRUE` causes Amazon S3 to reject calls to PUT Bucket policy if the specified bucket
    # policy allows public access.
    #
    # Enabling this setting doesn't affect existing bucket policies.
    property block_public_policy : Bool | Nil

    # Specifies whether Amazon S3 should restrict public bucket policies for this bucket. Setting this
    # element to `TRUE` restricts access to this bucket to only Amazon Web Services service principals
    # and authorized users within this account if the bucket has a public policy.
    #
    # Enabling this setting doesn't affect previously stored bucket policies, except that public and
    # cross-account access within any public bucket policy, including non-public delegation to
    # specific accounts, is blocked.
    property restrict_public_buckets : Bool | Nil

    def initialize(
      @block_public_acls : Bool | Nil = nil,
      @ignore_public_acls : Bool | Nil = nil,
      @block_public_policy : Bool | Nil = nil,
      @restrict_public_buckets : Bool | Nil = nil,
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
      if value = @block_public_acls
        xml.element("BlockPublicAcls") { xml.text Core::QueryValue.bool(value) }
      end

      if value = @ignore_public_acls
        xml.element("IgnorePublicAcls") { xml.text Core::QueryValue.bool(value) }
      end

      if value = @block_public_policy
        xml.element("BlockPublicPolicy") { xml.text Core::QueryValue.bool(value) }
      end

      if value = @restrict_public_buckets
        xml.element("RestrictPublicBuckets") { xml.text Core::QueryValue.bool(value) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        block_public_acls: Core::XMLValue.bool(node.xpath_node("*[local-name()='BlockPublicAcls']")),
        ignore_public_acls: Core::XMLValue.bool(node.xpath_node("*[local-name()='IgnorePublicAcls']")),
        block_public_policy: Core::XMLValue.bool(node.xpath_node("*[local-name()='BlockPublicPolicy']")),
        restrict_public_buckets: Core::XMLValue.bool(node.xpath_node("*[local-name()='RestrictPublicBuckets']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@block_public_acls, @ignore_public_acls, @block_public_policy, @restrict_public_buckets)
  end
end
