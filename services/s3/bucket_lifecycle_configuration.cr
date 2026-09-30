private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies the lifecycle configuration for objects in an Amazon S3 bucket. For more information,
  # see [Object Lifecycle
  # Management](https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html) in the
  # *Amazon S3 User Guide*.
  class BucketLifecycleConfiguration
    # A lifecycle rule for individual objects in an Amazon S3 bucket.
    property rules : Array(LifecycleRule) = [] of LifecycleRule

    def initialize(
      @rules : Array(LifecycleRule),
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
      @rules.each do |item|
        xml.element("Rule") { item.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        rules: node.xpath_nodes("*[local-name()='Rule']").map { |n| LifecycleRule.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @rules
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@rules)
  end
end
