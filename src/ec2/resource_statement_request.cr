module Amazonite::EC2
  # Describes a resource statement.
  class ResourceStatementRequest
    # The resources.
    property resources : Array(String) | Nil

    # The resource types.
    property resource_types : Array(String) | Nil

    def initialize(
      @resources : Array(String) | Nil = nil,
      @resource_types : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@resources || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Resource.#{i}", item}
      end

      (@resource_types || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ResourceType.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resources: node.xpath_nodes("*[local-name()='Resource']/*[local-name()='item']").map { |n| n.content },
        resource_types: node.xpath_nodes("*[local-name()='ResourceType']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@resources, @resource_types)
  end
end
