private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies the redirect behavior and when a redirect is applied. For more information about
  # routing rules, see [Configuring advanced conditional
  # redirects](https://docs.aws.amazon.com/AmazonS3/latest/dev/how-to-page-redirect.html#advanced-conditional-redirects)
  # in the *Amazon S3 User Guide*.
  class RoutingRule
    # A container for describing a condition that must be met for the specified redirect to apply. For
    # example, 1. If request is for pages in the `/docs` folder, redirect to the `/documents` folder.
    # 2. If request results in HTTP error 4xx, redirect request to another host where you might
    # process the error.
    property condition : Condition | Nil

    # Container for redirect information. You can redirect requests to another host, to another page,
    # or with another protocol. In the event of an error, you can specify a different error code to
    # return.
    property redirect : Redirect

    def initialize(
      @redirect : Redirect,
      @condition : Condition | Nil = nil,
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
      if value = @condition
        xml.element("Condition") { value.build_xml(xml) }
      end

      xml.element("Redirect") { @redirect.build_xml(xml) }
    end

    def self.from_xml(node : XML::Node) : self
      new(
        condition: node.xpath_node("*[local-name()='Condition']").try { |n| Condition.from_xml(n) },
        redirect: node.xpath_node("*[local-name()='Redirect']").try { |n| Redirect.from_xml(n) }.not_nil!,
      )
    end

    def validate! : Nil
      if value = @condition
        value.validate!
      end

      if value = @redirect
        value.validate!
      end
    end

    def_equals_and_hash(@condition, @redirect)
  end
end
