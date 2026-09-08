private alias Core = Amazonite::Core

module Amazonite::S3
  class GetBucketAclOutput
    # Container for the bucket owner's ID.
    property owner : Owner | Nil

    # A list of grants.
    property grants : Array(Grant) | Nil

    def initialize(
      @owner : Owner | Nil = nil,
      @grants : Array(Grant) | Nil = nil,
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
      if value = @owner
        xml.element("Owner") { value.build_xml(xml) }
      end

      xml.element("AccessControlList") do
        (@grants || [] of Grant).each do |item|
          xml.element("Grant") { item.build_xml(xml) }
        end
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        owner: node.xpath_node("*[local-name()='Owner']").try { |n| Owner.from_xml(n) },
        grants: node.xpath_nodes("*[local-name()='AccessControlList']/*[local-name()='Grant']").map { |n| Grant.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @owner
        value.validate!
      end

      if value = @grants
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@owner, @grants)
  end
end
