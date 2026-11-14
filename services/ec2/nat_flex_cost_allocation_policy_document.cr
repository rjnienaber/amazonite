private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the cost allocation policy document for NAT gateways.
  class NatFlexCostAllocationPolicyDocument
    # The resource granularity level at which networking costs are allocated. This parameter is
    # required. Specify exactly one value. Valid values are `eni`, `ec2`, `subnet`, `vpc`, `account`,
    # and `cidr`.
    property reporting_granularity : Array(FlexCostAllocationReportingGranularity) = [] of FlexCostAllocationReportingGranularity

    # The cost dimensions to report. This parameter is required. Valid values are `data-transfer` and
    # `data-processing`.
    property dimensions : Array(FlexCostAllocationCostDimension) = [] of FlexCostAllocationCostDimension

    # The CIDR range mappings to use for cost allocation. Specify this value when
    # `ReportingGranularity` is `cidr`, and omit it otherwise.
    property cidr_range_specifications : FlexCostAllocationCidrRangeSpecifications | Nil

    def initialize(
      @reporting_granularity : Array(FlexCostAllocationReportingGranularity),
      @dimensions : Array(FlexCostAllocationCostDimension),
      @cidr_range_specifications : FlexCostAllocationCidrRangeSpecifications | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @reporting_granularity.each_with_index(1) do |item, i|
        params << {"#{prefix}ReportingGranularity.#{i}", item.to_json_object_key}
      end

      @dimensions.each_with_index(1) do |item, i|
        params << {"#{prefix}Dimensions.#{i}", item.to_json_object_key}
      end

      if value = @cidr_range_specifications
        params.concat(value.to_query_params("#{prefix}CidrRangeSpecifications."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        reporting_granularity: node.xpath_nodes("*[local-name()='ReportingGranularity']/*[local-name()='item']").compact_map { |n| AEC::FlexCostAllocationReportingGranularity.from_json_object_key?(n.content) },
        dimensions: node.xpath_nodes("*[local-name()='Dimensions']/*[local-name()='item']").compact_map { |n| AEC::FlexCostAllocationCostDimension.from_json_object_key?(n.content) },
        cidr_range_specifications: node.xpath_node("*[local-name()='CidrRangeSpecifications']").try { |n| FlexCostAllocationCidrRangeSpecifications.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @reporting_granularity
        raise Core::ValidationError.new("ReportingGranularity must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("ReportingGranularity must have at most 1 item(s)") if value.size > 1
      end

      if value = @dimensions
        raise Core::ValidationError.new("Dimensions must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Dimensions must have at most 2 item(s)") if value.size > 2
      end

      if value = @cidr_range_specifications
        value.validate!
      end
    end

    def_equals_and_hash(@reporting_granularity, @dimensions, @cidr_range_specifications)
  end
end
