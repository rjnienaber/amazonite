private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a path.
  class AccessScopePathRequest
    # The source.
    property source : PathStatementRequest | Nil

    # The destination.
    property destination : PathStatementRequest | Nil

    # The through resources.
    property through_resources : Array(ThroughResourcesStatementRequest) | Nil

    def initialize(
      @source : PathStatementRequest | Nil = nil,
      @destination : PathStatementRequest | Nil = nil,
      @through_resources : Array(ThroughResourcesStatementRequest) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @source
        params.concat(value.to_query_params("#{prefix}Source."))
      end

      if value = @destination
        params.concat(value.to_query_params("#{prefix}Destination."))
      end

      (@through_resources || [] of ThroughResourcesStatementRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ThroughResource.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        source: node.xpath_node("*[local-name()='Source']").try { |n| PathStatementRequest.from_xml(n) },
        destination: node.xpath_node("*[local-name()='Destination']").try { |n| PathStatementRequest.from_xml(n) },
        through_resources: node.xpath_nodes("*[local-name()='ThroughResource']/*[local-name()='item']").map { |n| ThroughResourcesStatementRequest.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @source
        value.validate!
      end

      if value = @destination
        value.validate!
      end

      if value = @through_resources
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@source, @destination, @through_resources)
  end
end
