private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the Elastic Fabric Adapters for the instance type.
  class EfaInfo
    # The maximum number of Elastic Fabric Adapters for the instance type.
    property maximum_efa_interfaces : Int32 | Nil

    def initialize(
      @maximum_efa_interfaces : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @maximum_efa_interfaces
        params << {"#{prefix}MaximumEfaInterfaces", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        maximum_efa_interfaces: Core::XMLValue.i32(node.xpath_node("*[local-name()='maximumEfaInterfaces']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@maximum_efa_interfaces)
  end
end
