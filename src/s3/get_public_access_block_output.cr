private alias Core = Amazonite::Core

module Amazonite::S3
  class GetPublicAccessBlockOutput
    # The `PublicAccessBlock` configuration currently in effect for this Amazon S3 bucket.
    property public_access_block_configuration : PublicAccessBlockConfiguration | Nil

    def initialize(
      @public_access_block_configuration : PublicAccessBlockConfiguration | Nil = nil,
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
      if value = @public_access_block_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@public_access_block_configuration)
  end
end
