private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListResourceScanRelatedResourcesOutput
    property related_resources : Array(ScannedResource) | Nil

    property next_token : String | Nil

    def initialize(
      @related_resources : Array(ScannedResource) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@related_resources || [] of ScannedResource).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RelatedResources.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        related_resources: node.xpath_nodes("*[local-name()='RelatedResources']/*[local-name()='member']").map { |n| ScannedResource.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end
  end
end
