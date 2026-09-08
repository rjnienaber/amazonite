private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a load balancer listener.
  class AnalysisLoadBalancerListener
    # The port on which the load balancer is listening.
    property load_balancer_port : Int32 | Nil

    # [Classic Load Balancers] The back-end port for the listener.
    property instance_port : Int32 | Nil

    def initialize(
      @load_balancer_port : Int32 | Nil = nil,
      @instance_port : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @load_balancer_port
        params << {"#{prefix}LoadBalancerPort", value.to_s}
      end

      if value = @instance_port
        params << {"#{prefix}InstancePort", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        load_balancer_port: Core::XMLValue.i32(node.xpath_node("*[local-name()='loadBalancerPort']")),
        instance_port: Core::XMLValue.i32(node.xpath_node("*[local-name()='instancePort']")),
      )
    end

    def validate! : Nil
      if value = @load_balancer_port
        raise Core::ValidationError.new("LoadBalancerPort value must be >= 0") if value < 0
        raise Core::ValidationError.new("LoadBalancerPort value must be <= 65535") if value > 65535
      end

      if value = @instance_port
        raise Core::ValidationError.new("InstancePort value must be >= 0") if value < 0
        raise Core::ValidationError.new("InstancePort value must be <= 65535") if value > 65535
      end
    end

    def_equals_and_hash(@load_balancer_port, @instance_port)
  end
end
