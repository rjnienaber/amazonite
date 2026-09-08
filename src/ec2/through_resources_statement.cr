private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a through resource statement.
  class ThroughResourcesStatement
    # The resource statement.
    property resource_statement : ResourceStatement | Nil

    def initialize(
      @resource_statement : ResourceStatement | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @resource_statement
        params.concat(value.to_query_params("#{prefix}ResourceStatement."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_statement: node.xpath_node("*[local-name()='resourceStatement']").try { |n| ResourceStatement.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @resource_statement
        value.validate!
      end
    end

    def_equals_and_hash(@resource_statement)
  end
end
