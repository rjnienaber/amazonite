private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVpcEndpointServiceConfigurationsResult
    # Information about the services.
    property service_configurations : Array(ServiceConfiguration) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @service_configurations : Array(ServiceConfiguration) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@service_configurations || [] of ServiceConfiguration).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ServiceConfigurationSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        service_configurations: node.xpath_nodes("*[local-name()='serviceConfigurationSet']/*[local-name()='item']").map { |n| ServiceConfiguration.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @service_configurations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@service_configurations, @next_token)
  end
end
