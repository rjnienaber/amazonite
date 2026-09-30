private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateDefaultVpcResult
    # Information about the VPC.
    property vpc : Vpc | Nil

    def initialize(
      @vpc : Vpc | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @vpc
        params.concat(value.to_query_params("#{prefix}Vpc."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpc: node.xpath_node("*[local-name()='vpc']").try { |n| Vpc.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @vpc
        value.validate!
      end
    end

    def_equals_and_hash(@vpc)
  end
end
