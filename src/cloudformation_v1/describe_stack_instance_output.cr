module Amazonite::CloudFormationV1
  class DescribeStackInstanceOutput
    # The stack instance that matches the specified request parameters.
    property stack_instance : StackInstance | Nil

    def initialize(
      @stack_instance : StackInstance | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @stack_instance
        params.concat(value.to_query_params("#{prefix}StackInstance."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_instance: node.xpath_node("*[local-name()='StackInstance']").try { |n| StackInstance.from_xml(n) },
      )
    end
  end
end
