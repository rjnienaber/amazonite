private alias Core = Amazonite::Core

module Amazonite::S3
  # Container for the `Suffix` element.
  class IndexDocument
    # A suffix that is appended to a request that is for a directory on the website endpoint. (For
    # example, if the suffix is `index.html` and you make a request to `samplebucket/images/`, the
    # data that is returned will be for the object with the key name `images/index.html`.) The suffix
    # must not be empty and must not include a slash character.
    #
    # Replacement must be made for object keys containing special characters (such as carriage
    # returns) when using XML requests. For more information, see [ XML related object key
    # constraints](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints).
    property suffix : String

    def initialize(
      @suffix : String,
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
      xml.element("Suffix") { xml.text @suffix }
    end

    def self.from_xml(node : XML::Node) : self
      new(
        suffix: Core::XMLValue.string(node.xpath_node("*[local-name()='Suffix']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@suffix)
  end
end
