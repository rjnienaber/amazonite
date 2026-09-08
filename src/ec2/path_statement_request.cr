private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a path statement.
  class PathStatementRequest
    # The packet header statement.
    property packet_header_statement : PacketHeaderStatementRequest | Nil

    # The resource statement.
    property resource_statement : ResourceStatementRequest | Nil

    def initialize(
      @packet_header_statement : PacketHeaderStatementRequest | Nil = nil,
      @resource_statement : ResourceStatementRequest | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @packet_header_statement
        params.concat(value.to_query_params("#{prefix}PacketHeaderStatement."))
      end

      if value = @resource_statement
        params.concat(value.to_query_params("#{prefix}ResourceStatement."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        packet_header_statement: node.xpath_node("*[local-name()='PacketHeaderStatement']").try { |n| PacketHeaderStatementRequest.from_xml(n) },
        resource_statement: node.xpath_node("*[local-name()='ResourceStatement']").try { |n| ResourceStatementRequest.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @packet_header_statement
        value.validate!
      end

      if value = @resource_statement
        value.validate!
      end
    end

    def_equals_and_hash(@packet_header_statement, @resource_statement)
  end
end
