private alias Core = Amazonite::Core

module Amazonite::SnsV1
  # Response for `ListEndpointsByPlatformApplication` action.
  class ListEndpointsByPlatformApplicationResponse
    # Endpoints returned for `ListEndpointsByPlatformApplication` action.
    property endpoints : Array(Endpoint) | Nil

    # `NextToken` string is returned when calling `ListEndpointsByPlatformApplication` action if
    # additional records are available after the first page results.
    property next_token : String | Nil

    def initialize(
      @endpoints : Array(Endpoint) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@endpoints || [] of Endpoint).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Endpoints.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        endpoints: node.xpath_nodes("*[local-name()='Endpoints']/*[local-name()='member']").map { |n| Endpoint.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def_equals_and_hash(@endpoints, @next_token)
  end
end
