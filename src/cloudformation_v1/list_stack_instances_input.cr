private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListStackInstancesInput
    property stack_set_name : String

    property next_token : String | Nil

    property max_results : Int32 | Nil

    property filters : Array(StackInstanceFilter) | Nil

    property stack_instance_account : String | Nil

    property stack_instance_region : String | Nil

    property call_as : CallAs | Nil

    def initialize(
      @stack_set_name : String,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @filters : Array(StackInstanceFilter) | Nil = nil,
      @stack_instance_account : String | Nil = nil,
      @stack_instance_region : String | Nil = nil,
      @call_as : CallAs | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackSetName", @stack_set_name}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      (@filters || [] of StackInstanceFilter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filters.member.#{i}."))
      end

      if value = @stack_instance_account
        params << {"#{prefix}StackInstanceAccount", value}
      end

      if value = @stack_instance_region
        params << {"#{prefix}StackInstanceRegion", value}
      end

      if value = @call_as
        params << {"#{prefix}CallAs", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_set_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackSetName']")).not_nil!,
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        filters: node.xpath_nodes("*[local-name()='Filters']/*[local-name()='member']").map { |n| StackInstanceFilter.from_xml(n) },
        stack_instance_account: Core::XMLValue.string(node.xpath_node("*[local-name()='StackInstanceAccount']")),
        stack_instance_region: Core::XMLValue.string(node.xpath_node("*[local-name()='StackInstanceRegion']")),
        call_as: (n = node.xpath_node("*[local-name()='CallAs']")) ? ACF::CallAs.from_json_object_key?(n.content) : nil,
      )
    end
  end
end
