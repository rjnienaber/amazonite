module Amazonite::CloudFormationV1
  class DescribeStackResourceOutput
    property stack_resource_detail : StackResourceDetail | Nil

    def initialize(
      @stack_resource_detail : StackResourceDetail | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @stack_resource_detail
        params.concat(value.to_query_params("#{prefix}StackResourceDetail."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_resource_detail: node.xpath_node("*[local-name()='StackResourceDetail']").try { |n| StackResourceDetail.from_xml(n) },
      )
    end
  end
end
