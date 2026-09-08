private alias Core = Amazonite::Core

module Amazonite::S3
  class GetObjectRetentionOutput
    # The container element for an object's retention settings.
    property retention : ObjectLockRetention | Nil

    def initialize(
      @retention : ObjectLockRetention | Nil = nil,
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
    end

    def self.from_xml(node : XML::Node) : self
      new(
      )
    end

    def validate! : Nil
      if value = @retention
        value.validate!
      end
    end

    def_equals_and_hash(@retention)
  end
end
