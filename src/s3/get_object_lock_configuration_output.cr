private alias Core = Amazonite::Core

module Amazonite::S3
  class GetObjectLockConfigurationOutput
    # The specified bucket's Object Lock configuration.
    property object_lock_configuration : ObjectLockConfiguration | Nil

    def initialize(
      @object_lock_configuration : ObjectLockConfiguration | Nil = nil,
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
      if value = @object_lock_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@object_lock_configuration)
  end
end
