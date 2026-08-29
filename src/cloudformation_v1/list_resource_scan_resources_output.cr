private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListResourceScanResourcesOutput
    property resources : Array(ScannedResource) | Nil

    property next_token : String | Nil

    def initialize(
      @resources : Array(ScannedResource) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@resources || [] of ScannedResource).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Resources.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resources: node.xpath_nodes("*[local-name()='Resources']/*[local-name()='member']").map { |n| ScannedResource.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end
  end
end
