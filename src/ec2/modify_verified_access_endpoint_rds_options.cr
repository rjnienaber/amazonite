private alias Core = Amazonite::Core

module Amazonite::EC2
  # The RDS options for a Verified Access endpoint.
  class ModifyVerifiedAccessEndpointRdsOptions
    # The IDs of the subnets.
    property subnet_ids : Array(String) | Nil

    # The port.
    property port : Int32 | Nil

    # The RDS endpoint.
    property rds_endpoint : String | Nil

    def initialize(
      @subnet_ids : Array(String) | Nil = nil,
      @port : Int32 | Nil = nil,
      @rds_endpoint : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@subnet_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SubnetId.#{i}", item}
      end

      if value = @port
        params << {"#{prefix}Port", value.to_s}
      end

      if value = @rds_endpoint
        params << {"#{prefix}RdsEndpoint", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        subnet_ids: node.xpath_nodes("*[local-name()='SubnetId']/*[local-name()='item']").map { |n| n.content },
        port: Core::XMLValue.i32(node.xpath_node("*[local-name()='Port']")),
        rds_endpoint: Core::XMLValue.string(node.xpath_node("*[local-name()='RdsEndpoint']")),
      )
    end

    def validate! : Nil
      if value = @port
        raise Core::ValidationError.new("Port value must be >= 1") if value < 1
        raise Core::ValidationError.new("Port value must be <= 65535") if value > 65535
      end
    end

    def_equals_and_hash(@subnet_ids, @port, @rds_endpoint)
  end
end
