private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an additional detail for a path analysis. For more information, see [Reachability
  # Analyzer additional detail
  # codes](https://docs.aws.amazon.com/vpc/latest/reachability/additional-detail-codes.html).
  class AdditionalDetail
    # The additional detail code.
    property additional_detail_type : String | Nil

    # The path component.
    property component : AnalysisComponent | Nil

    # The VPC endpoint service.
    property vpc_endpoint_service : AnalysisComponent | Nil

    # The rule options.
    property rule_options : Array(RuleOption) | Nil

    # The rule group type.
    property rule_group_type_pairs : Array(RuleGroupTypePair) | Nil

    # The rule options.
    property rule_group_rule_options_pairs : Array(RuleGroupRuleOptionsPair) | Nil

    # The name of the VPC endpoint service.
    property service_name : String | Nil

    # The load balancers.
    property load_balancers : Array(AnalysisComponent) | Nil

    def initialize(
      @additional_detail_type : String | Nil = nil,
      @component : AnalysisComponent | Nil = nil,
      @vpc_endpoint_service : AnalysisComponent | Nil = nil,
      @rule_options : Array(RuleOption) | Nil = nil,
      @rule_group_type_pairs : Array(RuleGroupTypePair) | Nil = nil,
      @rule_group_rule_options_pairs : Array(RuleGroupRuleOptionsPair) | Nil = nil,
      @service_name : String | Nil = nil,
      @load_balancers : Array(AnalysisComponent) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @additional_detail_type
        params << {"#{prefix}AdditionalDetailType", value}
      end

      if value = @component
        params.concat(value.to_query_params("#{prefix}Component."))
      end

      if value = @vpc_endpoint_service
        params.concat(value.to_query_params("#{prefix}VpcEndpointService."))
      end

      (@rule_options || [] of RuleOption).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RuleOptionSet.#{i}."))
      end

      (@rule_group_type_pairs || [] of RuleGroupTypePair).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RuleGroupTypePairSet.#{i}."))
      end

      (@rule_group_rule_options_pairs || [] of RuleGroupRuleOptionsPair).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RuleGroupRuleOptionsPairSet.#{i}."))
      end

      if value = @service_name
        params << {"#{prefix}ServiceName", value}
      end

      (@load_balancers || [] of AnalysisComponent).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}LoadBalancerSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        additional_detail_type: Core::XMLValue.string(node.xpath_node("*[local-name()='additionalDetailType']")),
        component: node.xpath_node("*[local-name()='component']").try { |n| AnalysisComponent.from_xml(n) },
        vpc_endpoint_service: node.xpath_node("*[local-name()='vpcEndpointService']").try { |n| AnalysisComponent.from_xml(n) },
        rule_options: node.xpath_nodes("*[local-name()='ruleOptionSet']/*[local-name()='item']").map { |n| RuleOption.from_xml(n) },
        rule_group_type_pairs: node.xpath_nodes("*[local-name()='ruleGroupTypePairSet']/*[local-name()='item']").map { |n| RuleGroupTypePair.from_xml(n) },
        rule_group_rule_options_pairs: node.xpath_nodes("*[local-name()='ruleGroupRuleOptionsPairSet']/*[local-name()='item']").map { |n| RuleGroupRuleOptionsPair.from_xml(n) },
        service_name: Core::XMLValue.string(node.xpath_node("*[local-name()='serviceName']")),
        load_balancers: node.xpath_nodes("*[local-name()='loadBalancerSet']/*[local-name()='item']").map { |n| AnalysisComponent.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @component
        value.validate!
      end

      if value = @vpc_endpoint_service
        value.validate!
      end

      if value = @rule_options
        value.each(&.validate!)
      end

      if value = @rule_group_type_pairs
        value.each(&.validate!)
      end

      if value = @rule_group_rule_options_pairs
        value.each(&.validate!)
      end

      if value = @load_balancers
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@additional_detail_type, @component, @vpc_endpoint_service, @rule_options, @rule_group_type_pairs, @rule_group_rule_options_pairs, @service_name, @load_balancers)
  end
end
