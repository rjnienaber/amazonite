private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the Classic Load Balancers to attach to a Spot Fleet. Spot Fleet registers the running
  # Spot Instances with these Classic Load Balancers.
  class ClassicLoadBalancersConfig
    # One or more Classic Load Balancers.
    property classic_load_balancers : Array(ClassicLoadBalancer) | Nil

    def initialize(
      @classic_load_balancers : Array(ClassicLoadBalancer) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@classic_load_balancers || [] of ClassicLoadBalancer).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ClassicLoadBalancers.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        classic_load_balancers: node.xpath_nodes("*[local-name()='classicLoadBalancers']/*[local-name()='item']").map { |n| ClassicLoadBalancer.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @classic_load_balancers
        raise Core::ValidationError.new("ClassicLoadBalancers must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("ClassicLoadBalancers must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@classic_load_balancers)
  end
end
