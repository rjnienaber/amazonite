private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Classic Load Balancer.
  class ClassicLoadBalancer
    # The name of the load balancer.
    property name : String | Nil

    def initialize(
      @name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @name
        params << {"#{prefix}Name", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='name']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@name)
  end
end
