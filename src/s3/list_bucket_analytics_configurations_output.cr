private alias Core = Amazonite::Core

module Amazonite::S3
  class ListBucketAnalyticsConfigurationsOutput
    # Indicates whether the returned list of analytics configurations is complete. A value of true
    # indicates that the list is not complete and the NextContinuationToken will be provided for a
    # subsequent request.
    property is_truncated : Bool | Nil

    # The marker that is used as a starting point for this analytics configuration list response. This
    # value is present if it was sent in the request.
    property continuation_token : String | Nil

    # `NextContinuationToken` is sent when `isTruncated` is true, which indicates that there are more
    # analytics configurations to list. The next request must include this `NextContinuationToken`.
    # The token is obfuscated and is not a usable value.
    property next_continuation_token : String | Nil

    # The list of analytics configurations for a bucket.
    property analytics_configuration_list : Array(AnalyticsConfiguration) | Nil

    def initialize(
      @is_truncated : Bool | Nil = nil,
      @continuation_token : String | Nil = nil,
      @next_continuation_token : String | Nil = nil,
      @analytics_configuration_list : Array(AnalyticsConfiguration) | Nil = nil,
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
      if value = @is_truncated
        xml.element("IsTruncated") { xml.text Core::QueryValue.bool(value) }
      end

      if value = @continuation_token
        xml.element("ContinuationToken") { xml.text value }
      end

      if value = @next_continuation_token
        xml.element("NextContinuationToken") { xml.text value }
      end

      (@analytics_configuration_list || [] of AnalyticsConfiguration).each do |item|
        xml.element("AnalyticsConfiguration") { item.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        is_truncated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsTruncated']")),
        continuation_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ContinuationToken']")),
        next_continuation_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextContinuationToken']")),
        analytics_configuration_list: node.xpath_nodes("*[local-name()='AnalyticsConfiguration']").map { |n| AnalyticsConfiguration.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @analytics_configuration_list
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@is_truncated, @continuation_token, @next_continuation_token, @analytics_configuration_list)
  end
end
