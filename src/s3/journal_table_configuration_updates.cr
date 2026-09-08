private alias Core = Amazonite::Core

module Amazonite::S3
  # The specified updates to the S3 Metadata journal table configuration.
  class JournalTableConfigurationUpdates
    # The journal table record expiration settings for the journal table.
    property record_expiration : RecordExpiration

    def initialize(
      @record_expiration : RecordExpiration,
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
      xml.element("RecordExpiration") { @record_expiration.build_xml(xml) }
    end

    def self.from_xml(node : XML::Node) : self
      new(
        record_expiration: node.xpath_node("*[local-name()='RecordExpiration']").try { |n| RecordExpiration.from_xml(n) }.not_nil!,
      )
    end

    def validate! : Nil
      if value = @record_expiration
        value.validate!
      end
    end

    def_equals_and_hash(@record_expiration)
  end
end
