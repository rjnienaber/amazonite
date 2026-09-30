private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the Classic Load Balancers and target groups to attach to a Spot Fleet request.
  class LoadBalancersConfig
    # The Classic Load Balancers.
    property classic_load_balancers_config : ClassicLoadBalancersConfig | Nil

    # The target groups.
    property target_groups_config : TargetGroupsConfig | Nil

    def initialize(
      @classic_load_balancers_config : ClassicLoadBalancersConfig | Nil = nil,
      @target_groups_config : TargetGroupsConfig | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @classic_load_balancers_config
        params.concat(value.to_query_params("#{prefix}ClassicLoadBalancersConfig."))
      end

      if value = @target_groups_config
        params.concat(value.to_query_params("#{prefix}TargetGroupsConfig."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        classic_load_balancers_config: node.xpath_node("*[local-name()='classicLoadBalancersConfig']").try { |n| ClassicLoadBalancersConfig.from_xml(n) },
        target_groups_config: node.xpath_node("*[local-name()='targetGroupsConfig']").try { |n| TargetGroupsConfig.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @classic_load_balancers_config
        value.validate!
      end

      if value = @target_groups_config
        value.validate!
      end
    end

    def_equals_and_hash(@classic_load_balancers_config, @target_groups_config)
  end
end
