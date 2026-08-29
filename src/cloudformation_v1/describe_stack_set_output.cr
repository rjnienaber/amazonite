module Amazonite::CloudFormationV1
  class DescribeStackSetOutput
    # The specified StackSet.
    property stack_set : StackSet | Nil

    def initialize(
      @stack_set : StackSet | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @stack_set
        params.concat(value.to_query_params("#{prefix}StackSet."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_set: node.xpath_node("*[local-name()='StackSet']").try { |n| StackSet.from_xml(n) },
      )
    end
  end
end
