private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # The output for a DescribeStacks action.
  class DescribeStacksOutput
    # A list of stack structures.
    property stacks : Array(Stack) | Nil

    # If the output exceeds 1 MB in size, a string that identifies the next page of stacks. If no
    # additional page exists, this value is null.
    property next_token : String | Nil

    def initialize(
      @stacks : Array(Stack) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@stacks || [] of Stack).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Stacks.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stacks: node.xpath_nodes("*[local-name()='Stacks']/*[local-name()='member']").map { |n| Stack.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
      if value = @stacks
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@stacks, @next_token)
  end
end
