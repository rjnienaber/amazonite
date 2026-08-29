private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class StackSetOperationPreferences
    property region_concurrency_type : RegionConcurrencyType | Nil

    property region_order : Array(String) | Nil

    property failure_tolerance_count : Int32 | Nil

    property failure_tolerance_percentage : Int32 | Nil

    property max_concurrent_count : Int32 | Nil

    property max_concurrent_percentage : Int32 | Nil

    property concurrency_mode : ConcurrencyMode | Nil

    def initialize(
      @region_concurrency_type : RegionConcurrencyType | Nil = nil,
      @region_order : Array(String) | Nil = nil,
      @failure_tolerance_count : Int32 | Nil = nil,
      @failure_tolerance_percentage : Int32 | Nil = nil,
      @max_concurrent_count : Int32 | Nil = nil,
      @max_concurrent_percentage : Int32 | Nil = nil,
      @concurrency_mode : ConcurrencyMode | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @region_concurrency_type
        params << {"#{prefix}RegionConcurrencyType", value.to_json_object_key}
      end

      (@region_order || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}RegionOrder.member.#{i}", item}
      end

      if value = @failure_tolerance_count
        params << {"#{prefix}FailureToleranceCount", value.to_s}
      end

      if value = @failure_tolerance_percentage
        params << {"#{prefix}FailureTolerancePercentage", value.to_s}
      end

      if value = @max_concurrent_count
        params << {"#{prefix}MaxConcurrentCount", value.to_s}
      end

      if value = @max_concurrent_percentage
        params << {"#{prefix}MaxConcurrentPercentage", value.to_s}
      end

      if value = @concurrency_mode
        params << {"#{prefix}ConcurrencyMode", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        region_concurrency_type: (n = node.xpath_node("*[local-name()='RegionConcurrencyType']")) ? ACF::RegionConcurrencyType.from_json_object_key?(n.content) : nil,
        region_order: node.xpath_nodes("*[local-name()='RegionOrder']/*[local-name()='member']").map { |n| n.content },
        failure_tolerance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='FailureToleranceCount']")),
        failure_tolerance_percentage: Core::XMLValue.i32(node.xpath_node("*[local-name()='FailureTolerancePercentage']")),
        max_concurrent_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxConcurrentCount']")),
        max_concurrent_percentage: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxConcurrentPercentage']")),
        concurrency_mode: (n = node.xpath_node("*[local-name()='ConcurrencyMode']")) ? ACF::ConcurrencyMode.from_json_object_key?(n.content) : nil,
      )
    end
  end
end
