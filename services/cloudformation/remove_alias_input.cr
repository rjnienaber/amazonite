private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # The input for the RemoveAlias action.
  class RemoveAliasInput
    # The alias name to remove.
    property alias_name : String

    def initialize(
      @alias_name : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}AliasName", @alias_name}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        alias_name: Core::XMLValue.string(node.xpath_node("*[local-name()='AliasName']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @alias_name
        raise Core::ValidationError.new("AliasName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AliasName length must be <= 128") if value.size > 128
      end
    end

    def_equals_and_hash(@alias_name)
  end
end
