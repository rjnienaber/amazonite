private alias Core = Amazonite::Core

module Amazonite::EC2
  # Specifies the CIDR ranges and labels to use for cost allocation when the reporting granularity
  # is `cidr`.
  class FlexCostAllocationCidrRangeSpecifications
    # The type of prefixes to use. This parameter is required. Valid values are `source-prefixes` and
    # `destination-prefixes`.
    property prefixes_type : String

    # The CIDR range to label mappings. You can specify from 1 to 100 mappings. This parameter is
    # required.
    property prefixes : Array(FlexCostAllocationCidrMapping) = [] of FlexCostAllocationCidrMapping

    def initialize(
      @prefixes_type : String,
      @prefixes : Array(FlexCostAllocationCidrMapping),
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}PrefixesType", @prefixes_type}

      @prefixes.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Prefixes.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        prefixes_type: Core::XMLValue.string(node.xpath_node("*[local-name()='PrefixesType']")).not_nil!,
        prefixes: node.xpath_nodes("*[local-name()='Prefixes']/*[local-name()='item']").map { |n| FlexCostAllocationCidrMapping.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @prefixes_type
        raise Core::ValidationError.new("PrefixesType length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PrefixesType length must be <= 64") if value.size > 64
      end

      if value = @prefixes
        raise Core::ValidationError.new("Prefixes must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Prefixes must have at most 100 item(s)") if value.size > 100
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@prefixes_type, @prefixes)
  end
end
