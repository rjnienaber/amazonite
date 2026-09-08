private alias Core = Amazonite::Core

module Amazonite::S3
  class ListBucketMetricsConfigurationsOutput
    # Indicates whether the returned list of metrics configurations is complete. A value of true
    # indicates that the list is not complete and the NextContinuationToken will be provided for a
    # subsequent request.
    property is_truncated : Bool | Nil

    # The marker that is used as a starting point for this metrics configuration list response. This
    # value is present if it was sent in the request.
    property continuation_token : String | Nil

    # The marker used to continue a metrics configuration listing that has been truncated. Use the
    # `NextContinuationToken` from a previously truncated list response to continue the listing. The
    # continuation token is an opaque value that Amazon S3 understands.
    property next_continuation_token : String | Nil

    # The list of metrics configurations for a bucket.
    property metrics_configuration_list : Array(MetricsConfiguration) | Nil

    def initialize(
      @is_truncated : Bool | Nil = nil,
      @continuation_token : String | Nil = nil,
      @next_continuation_token : String | Nil = nil,
      @metrics_configuration_list : Array(MetricsConfiguration) | Nil = nil,
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

      (@metrics_configuration_list || [] of MetricsConfiguration).each do |item|
        xml.element("MetricsConfiguration") { item.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        is_truncated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsTruncated']")),
        continuation_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ContinuationToken']")),
        next_continuation_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextContinuationToken']")),
        metrics_configuration_list: node.xpath_nodes("*[local-name()='MetricsConfiguration']").map { |n| MetricsConfiguration.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @metrics_configuration_list
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@is_truncated, @continuation_token, @next_continuation_token, @metrics_configuration_list)
  end
end
