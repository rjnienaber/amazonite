private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeKeyPairsResult
    # Information about the key pairs.
    property key_pairs : Array(KeyPairInfo) | Nil

    def initialize(
      @key_pairs : Array(KeyPairInfo) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@key_pairs || [] of KeyPairInfo).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}KeySet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        key_pairs: node.xpath_nodes("*[local-name()='keySet']/*[local-name()='item']").map { |n| KeyPairInfo.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @key_pairs
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@key_pairs)
  end
end
