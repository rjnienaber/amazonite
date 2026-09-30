private alias Core = Amazonite::Core

module Amazonite::S3
  # Describes the cross-origin access configuration for objects in an Amazon S3 bucket. For more
  # information, see [Enabling Cross-Origin Resource
  # Sharing](https://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html) in the *Amazon S3 User
  # Guide*.
  class CORSConfiguration
    # A set of origins and methods (cross-origin access that you want to allow). You can add up to 100
    # rules to the configuration.
    property cors_rules : Array(CORSRule) = [] of CORSRule

    def initialize(
      @cors_rules : Array(CORSRule),
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
      @cors_rules.each do |item|
        xml.element("CORSRule") { item.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cors_rules: node.xpath_nodes("*[local-name()='CORSRule']").map { |n| CORSRule.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @cors_rules
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@cors_rules)
  end
end
