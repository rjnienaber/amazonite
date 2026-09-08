private alias Core = Amazonite::Core

module Amazonite::S3
  class ListBucketInventoryConfigurationsOutput
    # If sent in the request, the marker that is used as a starting point for this inventory
    # configuration list response.
    property continuation_token : String | Nil

    # The list of inventory configurations for a bucket.
    property inventory_configuration_list : Array(InventoryConfiguration) | Nil

    # Tells whether the returned list of inventory configurations is complete. A value of true
    # indicates that the list is not complete and the NextContinuationToken is provided for a
    # subsequent request.
    property is_truncated : Bool | Nil

    # The marker used to continue this inventory configuration listing. Use the
    # `NextContinuationToken` from this response to continue the listing in a subsequent request. The
    # continuation token is an opaque value that Amazon S3 understands.
    property next_continuation_token : String | Nil

    def initialize(
      @continuation_token : String | Nil = nil,
      @inventory_configuration_list : Array(InventoryConfiguration) | Nil = nil,
      @is_truncated : Bool | Nil = nil,
      @next_continuation_token : String | Nil = nil,
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
      if value = @continuation_token
        xml.element("ContinuationToken") { xml.text value }
      end

      (@inventory_configuration_list || [] of InventoryConfiguration).each do |item|
        xml.element("InventoryConfiguration") { item.build_xml(xml) }
      end

      if value = @is_truncated
        xml.element("IsTruncated") { xml.text Core::QueryValue.bool(value) }
      end

      if value = @next_continuation_token
        xml.element("NextContinuationToken") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        continuation_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ContinuationToken']")),
        inventory_configuration_list: node.xpath_nodes("*[local-name()='InventoryConfiguration']").map { |n| InventoryConfiguration.from_xml(n) },
        is_truncated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsTruncated']")),
        next_continuation_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextContinuationToken']")),
      )
    end

    def validate! : Nil
      if value = @inventory_configuration_list
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@continuation_token, @inventory_configuration_list, @is_truncated, @next_continuation_token)
  end
end
