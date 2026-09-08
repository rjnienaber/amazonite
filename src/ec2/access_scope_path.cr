private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a path.
  class AccessScopePath
    # The source.
    property source : PathStatement | Nil

    # The destination.
    property destination : PathStatement | Nil

    # The through resources.
    property through_resources : Array(ThroughResourcesStatement) | Nil

    def initialize(
      @source : PathStatement | Nil = nil,
      @destination : PathStatement | Nil = nil,
      @through_resources : Array(ThroughResourcesStatement) | Nil = nil,
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

      (@through_resources || [] of ThroughResourcesStatement).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ThroughResourceSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        source: node.xpath_node("*[local-name()='source']").try { |n| PathStatement.from_xml(n) },
        destination: node.xpath_node("*[local-name()='destination']").try { |n| PathStatement.from_xml(n) },
        through_resources: node.xpath_nodes("*[local-name()='throughResourceSet']/*[local-name()='item']").map { |n| ThroughResourcesStatement.from_xml(n) },
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
