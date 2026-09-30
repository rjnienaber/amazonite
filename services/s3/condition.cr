private alias Core = Amazonite::Core

module Amazonite::S3
  # A container for describing a condition that must be met for the specified redirect to apply. For
  # example, 1. If request is for pages in the `/docs` folder, redirect to the `/documents` folder.
  # 2. If request results in HTTP error 4xx, redirect request to another host where you might
  # process the error.
  class Condition
    # The HTTP error code when the redirect is applied. In the event of an error, if the error code
    # equals this value, then the specified redirect is applied. Required when parent element
    # `Condition` is specified and sibling `KeyPrefixEquals` is not specified. If both are specified,
    # then both must be true for the redirect to be applied.
    property http_error_code_returned_equals : String | Nil

    # The object key name prefix when the redirect is applied. For example, to redirect requests for
    # `ExamplePage.html`, the key prefix will be `ExamplePage.html`. To redirect request for all pages
    # with the prefix `docs/`, the key prefix will be `/docs`, which identifies all objects in the
    # `docs/` folder. Required when the parent element `Condition` is specified and sibling
    # `HttpErrorCodeReturnedEquals` is not specified. If both conditions are specified, both must be
    # true for the redirect to be applied.
    #
    # Replacement must be made for object keys containing special characters (such as carriage
    # returns) when using XML requests. For more information, see [ XML related object key
    # constraints](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints).
    property key_prefix_equals : String | Nil

    def initialize(
      @http_error_code_returned_equals : String | Nil = nil,
      @key_prefix_equals : String | Nil = nil,
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
      if value = @http_error_code_returned_equals
        xml.element("HttpErrorCodeReturnedEquals") { xml.text value }
      end

      if value = @key_prefix_equals
        xml.element("KeyPrefixEquals") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        http_error_code_returned_equals: Core::XMLValue.string(node.xpath_node("*[local-name()='HttpErrorCodeReturnedEquals']")),
        key_prefix_equals: Core::XMLValue.string(node.xpath_node("*[local-name()='KeyPrefixEquals']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@http_error_code_returned_equals, @key_prefix_equals)
  end
end
