private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the RDS options for a Verified Access endpoint.
  class CreateVerifiedAccessEndpointRdsOptions
    # The protocol.
    property protocol : VerifiedAccessEndpointProtocol | Nil

    # The port.
    property port : Int32 | Nil

    # The ARN of the RDS instance.
    property rds_db_instance_arn : String | Nil

    # The ARN of the DB cluster.
    property rds_db_cluster_arn : String | Nil

    # The ARN of the RDS proxy.
    property rds_db_proxy_arn : String | Nil

    # The RDS endpoint.
    property rds_endpoint : String | Nil

    # The IDs of the subnets. You can specify only one subnet per Availability Zone.
    property subnet_ids : Array(String) | Nil

    def initialize(
      @protocol : VerifiedAccessEndpointProtocol | Nil = nil,
      @port : Int32 | Nil = nil,
      @rds_db_instance_arn : String | Nil = nil,
      @rds_db_cluster_arn : String | Nil = nil,
      @rds_db_proxy_arn : String | Nil = nil,
      @rds_endpoint : String | Nil = nil,
      @subnet_ids : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @protocol
        params << {"#{prefix}Protocol", value.to_json_object_key}
      end

      if value = @port
        params << {"#{prefix}Port", value.to_s}
      end

      if value = @rds_db_instance_arn
        params << {"#{prefix}RdsDbInstanceArn", value}
      end

      if value = @rds_db_cluster_arn
        params << {"#{prefix}RdsDbClusterArn", value}
      end

      if value = @rds_db_proxy_arn
        params << {"#{prefix}RdsDbProxyArn", value}
      end

      if value = @rds_endpoint
        params << {"#{prefix}RdsEndpoint", value}
      end

      (@subnet_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SubnetId.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        protocol: (n = node.xpath_node("*[local-name()='Protocol']")) ? AEC::VerifiedAccessEndpointProtocol.from_json_object_key?(n.content) : nil,
        port: Core::XMLValue.i32(node.xpath_node("*[local-name()='Port']")),
        rds_db_instance_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='RdsDbInstanceArn']")),
        rds_db_cluster_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='RdsDbClusterArn']")),
        rds_db_proxy_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='RdsDbProxyArn']")),
        rds_endpoint: Core::XMLValue.string(node.xpath_node("*[local-name()='RdsEndpoint']")),
        subnet_ids: node.xpath_nodes("*[local-name()='SubnetId']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @port
        raise Core::ValidationError.new("Port value must be >= 1") if value < 1
        raise Core::ValidationError.new("Port value must be <= 65535") if value > 65535
      end
    end

    def_equals_and_hash(@protocol, @port, @rds_db_instance_arn, @rds_db_cluster_arn, @rds_db_proxy_arn, @rds_endpoint, @subnet_ids)
  end
end
