private alias Core = Amazonite::Core

module Amazonite::S3
  class GetObjectTaggingOutput
    # The versionId of the object for which you got the tagging information.
    property version_id : String | Nil

    # Contains the tag set.
    property tag_set : Array(Tag) = [] of Tag

    def initialize(
      @tag_set : Array(Tag),
      @version_id : String | Nil = nil,
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
      xml.element("TagSet") do
        @tag_set.each do |item|
          xml.element("Tag") { item.build_xml(xml) }
        end
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        tag_set: node.xpath_nodes("*[local-name()='TagSet']/*[local-name()='Tag']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tag_set
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@version_id, @tag_set)
  end
end
