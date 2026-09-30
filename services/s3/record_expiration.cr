private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # The journal table record expiration settings for a journal table in an S3 Metadata
  # configuration.
  class RecordExpiration
    # Specifies whether journal table record expiration is enabled or disabled.
    property expiration : ExpirationState

    # If you enable journal table record expiration, you can set the number of days to retain your
    # journal table records. Journal table records must be retained for a minimum of 7 days. To set
    # this value, specify any whole number from `7` to `2147483647`. For example, to retain your
    # journal table records for one year, set this value to `365`.
    property days : Int32 | Nil

    def initialize(
      @expiration : ExpirationState,
      @days : Int32 | Nil = nil,
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
      xml.element("Expiration") { xml.text @expiration.to_json_object_key }

      if value = @days
        xml.element("Days") { xml.text value.to_s }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        expiration: ((n = node.xpath_node("*[local-name()='Expiration']")) ? AS::ExpirationState.from_json_object_key?(n.content) : nil).not_nil!,
        days: Core::XMLValue.i32(node.xpath_node("*[local-name()='Days']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@expiration, @days)
  end
end
