private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreatePublicIpv4PoolResult
    # The ID of the public IPv4 pool.
    property pool_id : String | Nil

    def initialize(
      @pool_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @pool_id
        params << {"#{prefix}PoolId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='poolId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@pool_id)
  end
end
