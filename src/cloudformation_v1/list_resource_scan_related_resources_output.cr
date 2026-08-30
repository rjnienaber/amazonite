private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListResourceScanRelatedResourcesOutput
    # List of up to `MaxResults` resources in the specified resource scan related to the specified
    # resources.
    property related_resources : Array(ScannedResource) | Nil

    # If the request doesn't return all the remaining results, `NextToken` is set to a token. To
    # retrieve the next set of results, call `ListResourceScanRelatedResources` again and use that
    # value for the `NextToken` parameter. If the request returns all results, `NextToken` is set to
    # an empty string.
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

    def_equals_and_hash(@related_resources, @next_token)
  end
end
