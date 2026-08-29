private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class AutoDeployment
    property enabled : Bool | Nil

    property retain_stacks_on_account_removal : Bool | Nil

    property depends_on : Array(String) | Nil

    def initialize(
      @enabled : Bool | Nil = nil,
      @retain_stacks_on_account_removal : Bool | Nil = nil,
      @depends_on : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @enabled
        params << {"#{prefix}Enabled", Core::QueryValue.bool(value)}
      end

      if value = @retain_stacks_on_account_removal
        params << {"#{prefix}RetainStacksOnAccountRemoval", Core::QueryValue.bool(value)}
      end

      (@depends_on || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}DependsOn.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='Enabled']")),
        retain_stacks_on_account_removal: Core::XMLValue.bool(node.xpath_node("*[local-name()='RetainStacksOnAccountRemoval']")),
        depends_on: node.xpath_nodes("*[local-name()='DependsOn']/*[local-name()='member']").map { |n| n.content },
      )
    end
  end
end
