private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # The input for the SetAlias action.
  class SetAliasInput
    # The name or unique stack ID of the stack to assign an alias to.
    property stack_name : String

    # The alias to assign to the stack. The alias can then be used in place of the stack name in any
    # API call that accepts `StackName`.
    #
    # The name must be unique within the same account and Region. It cannot match an existing stack
    # name or another active alias.
    #
    # An alias name can contain only alphanumeric characters (case-sensitive) and hyphens. It must
    # start with an alphabetic character and can't be longer than 128 characters.
    property alias_name : String

    def initialize(
      @stack_name : String,
      @alias_name : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackName", @stack_name}

      params << {"#{prefix}AliasName", @alias_name}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")).not_nil!,
        alias_name: Core::XMLValue.string(node.xpath_node("*[local-name()='AliasName']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @alias_name
        raise Core::ValidationError.new("AliasName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AliasName length must be <= 128") if value.size > 128
      end
    end

    def_equals_and_hash(@stack_name, @alias_name)
  end
end
