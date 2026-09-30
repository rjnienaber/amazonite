private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteCoipPoolResult
    # Information about the CoIP address pool.
    property coip_pool : CoipPool | Nil

    def initialize(
      @coip_pool : CoipPool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @coip_pool
        params.concat(value.to_query_params("#{prefix}CoipPool."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        coip_pool: node.xpath_node("*[local-name()='coipPool']").try { |n| CoipPool.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @coip_pool
        value.validate!
      end
    end

    def_equals_and_hash(@coip_pool)
  end
end
