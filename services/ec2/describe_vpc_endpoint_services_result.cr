private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVpcEndpointServicesResult
    # The supported services.
    property service_names : Array(String) | Nil

    # Information about the service.
    property service_details : Array(ServiceDetail) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    property next_token : String | Nil

    def initialize(
      @service_names : Array(String) | Nil = nil,
      @service_details : Array(ServiceDetail) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@service_names || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ServiceNameSet.#{i}", item}
      end

      (@service_details || [] of ServiceDetail).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ServiceDetailSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        service_names: node.xpath_nodes("*[local-name()='serviceNameSet']/*[local-name()='item']").map { |n| n.content },
        service_details: node.xpath_nodes("*[local-name()='serviceDetailSet']/*[local-name()='item']").map { |n| ServiceDetail.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @service_details
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@service_names, @service_details, @next_token)
  end
end
