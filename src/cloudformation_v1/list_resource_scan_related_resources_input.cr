private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListResourceScanRelatedResourcesInput
    property resource_scan_id : String

    property resources : Array(ScannedResourceIdentifier) = [] of ScannedResourceIdentifier

    property next_token : String | Nil

    property max_results : Int32 | Nil

    def initialize(
      @resource_scan_id : String,
      @resources : Array(ScannedResourceIdentifier),
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ResourceScanId", @resource_scan_id}

      @resources.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Resources.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_scan_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceScanId']")).not_nil!,
        resources: node.xpath_nodes("*[local-name()='Resources']/*[local-name()='member']").map { |n| ScannedResourceIdentifier.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
      )
    end
  end
end
