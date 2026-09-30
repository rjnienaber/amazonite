private alias Core = Amazonite::Core

module Amazonite::S3
  class ListBucketIntelligentTieringConfigurationsOutput
    # Indicates whether the returned list of analytics configurations is complete. A value of `true`
    # indicates that the list is not complete and the `NextContinuationToken` will be provided for a
    # subsequent request.
    property is_truncated : Bool | Nil

    # The `ContinuationToken` that represents a placeholder from where this request should begin.
    property continuation_token : String | Nil

    # The marker used to continue this inventory configuration listing. Use the
    # `NextContinuationToken` from this response to continue the listing in a subsequent request. The
    # continuation token is an opaque value that Amazon S3 understands.
    property next_continuation_token : String | Nil

    # The list of S3 Intelligent-Tiering configurations for a bucket.
    property intelligent_tiering_configuration_list : Array(IntelligentTieringConfiguration) | Nil

    def initialize(
      @is_truncated : Bool | Nil = nil,
      @continuation_token : String | Nil = nil,
      @next_continuation_token : String | Nil = nil,
      @intelligent_tiering_configuration_list : Array(IntelligentTieringConfiguration) | Nil = nil,
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

      (@intelligent_tiering_configuration_list || [] of IntelligentTieringConfiguration).each do |item|
        xml.element("IntelligentTieringConfiguration") { item.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        is_truncated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsTruncated']")),
        continuation_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ContinuationToken']")),
        next_continuation_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextContinuationToken']")),
        intelligent_tiering_configuration_list: node.xpath_nodes("*[local-name()='IntelligentTieringConfiguration']").map { |n| IntelligentTieringConfiguration.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @intelligent_tiering_configuration_list
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@is_truncated, @continuation_token, @next_continuation_token, @intelligent_tiering_configuration_list)
  end
end
