private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies website configuration parameters for an Amazon S3 bucket.
  class WebsiteConfiguration
    # The name of the error document for the website.
    property error_document : ErrorDocument | Nil

    # The name of the index document for the website.
    property index_document : IndexDocument | Nil

    # The redirect behavior for every request to this bucket's website endpoint.
    #
    # If you specify this property, you can't specify any other property.
    property redirect_all_requests_to : RedirectAllRequestsTo | Nil

    # Rules that define when a redirect is applied and the redirect behavior.
    property routing_rules : Array(RoutingRule) | Nil

    def initialize(
      @error_document : ErrorDocument | Nil = nil,
      @index_document : IndexDocument | Nil = nil,
      @redirect_all_requests_to : RedirectAllRequestsTo | Nil = nil,
      @routing_rules : Array(RoutingRule) | Nil = nil,
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
      if value = @error_document
        xml.element("ErrorDocument") { value.build_xml(xml) }
      end

      if value = @index_document
        xml.element("IndexDocument") { value.build_xml(xml) }
      end

      if value = @redirect_all_requests_to
        xml.element("RedirectAllRequestsTo") { value.build_xml(xml) }
      end

      xml.element("RoutingRules") do
        (@routing_rules || [] of RoutingRule).each do |item|
          xml.element("RoutingRule") { item.build_xml(xml) }
        end
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        error_document: node.xpath_node("*[local-name()='ErrorDocument']").try { |n| ErrorDocument.from_xml(n) },
        index_document: node.xpath_node("*[local-name()='IndexDocument']").try { |n| IndexDocument.from_xml(n) },
        redirect_all_requests_to: node.xpath_node("*[local-name()='RedirectAllRequestsTo']").try { |n| RedirectAllRequestsTo.from_xml(n) },
        routing_rules: node.xpath_nodes("*[local-name()='RoutingRules']/*[local-name()='RoutingRule']").map { |n| RoutingRule.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @error_document
        value.validate!
      end

      if value = @index_document
        value.validate!
      end

      if value = @redirect_all_requests_to
        value.validate!
      end

      if value = @routing_rules
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@error_document, @index_document, @redirect_all_requests_to, @routing_rules)
  end
end
