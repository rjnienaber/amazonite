private alias Core = Amazonite::Core

module Amazonite::S3
  # A container for replication rules. You can add up to 1,000 rules. The maximum size of a
  # replication configuration is 2 MB.
  class ReplicationConfiguration
    # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that Amazon S3
    # assumes when replicating objects. For more information, see [How to Set Up
    # Replication](https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-how-setup.html) in the
    # *Amazon S3 User Guide*.
    property role : String

    # A container for one or more replication rules. A replication configuration must have at least
    # one rule and can contain a maximum of 1,000 rules.
    property rules : Array(ReplicationRule) = [] of ReplicationRule

    def initialize(
      @role : String,
      @rules : Array(ReplicationRule),
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
      xml.element("Role") { xml.text @role }

      @rules.each do |item|
        xml.element("Rule") { item.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        role: Core::XMLValue.string(node.xpath_node("*[local-name()='Role']")).not_nil!,
        rules: node.xpath_nodes("*[local-name()='Rule']").map { |n| ReplicationRule.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @rules
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@role, @rules)
  end
end
