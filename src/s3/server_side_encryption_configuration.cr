private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies the default server-side-encryption configuration.
  class ServerSideEncryptionConfiguration
    # Container for information about a particular server-side encryption configuration rule.
    property rules : Array(ServerSideEncryptionRule) = [] of ServerSideEncryptionRule

    def initialize(
      @rules : Array(ServerSideEncryptionRule),
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
        rules: node.xpath_nodes("*[local-name()='Rule']").map { |n| ServerSideEncryptionRule.from_xml(n) },
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
