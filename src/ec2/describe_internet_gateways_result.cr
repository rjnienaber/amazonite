private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeInternetGatewaysResult
    # Information about the internet gateways.
    property internet_gateways : Array(InternetGateway) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @internet_gateways : Array(InternetGateway) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@internet_gateways || [] of InternetGateway).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}InternetGatewaySet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        internet_gateways: node.xpath_nodes("*[local-name()='internetGatewaySet']/*[local-name()='item']").map { |n| InternetGateway.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @internet_gateways
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@internet_gateways, @next_token)
  end
end
