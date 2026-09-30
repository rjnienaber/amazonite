private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteIpamResult
    # Information about the results of the deletion.
    property ipam : Ipam | Nil

    def initialize(
      @ipam : Ipam | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipam
        params.concat(value.to_query_params("#{prefix}Ipam."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam: node.xpath_node("*[local-name()='ipam']").try { |n| Ipam.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam
        value.validate!
      end
    end

    def_equals_and_hash(@ipam)
  end
end
