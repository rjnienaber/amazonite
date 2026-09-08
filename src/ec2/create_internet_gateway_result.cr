private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateInternetGatewayResult
    # Information about the internet gateway.
    property internet_gateway : InternetGateway | Nil

    def initialize(
      @internet_gateway : InternetGateway | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @internet_gateway
        params.concat(value.to_query_params("#{prefix}InternetGateway."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        internet_gateway: node.xpath_node("*[local-name()='internetGateway']").try { |n| InternetGateway.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @internet_gateway
        value.validate!
      end
    end

    def_equals_and_hash(@internet_gateway)
  end
end
