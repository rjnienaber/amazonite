private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyPublicIpDnsNameOptionsResult
    # Whether or not the request was successful.
    property successful : Bool | Nil

    def initialize(
      @successful : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @successful
        params << {"#{prefix}Successful", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        successful: Core::XMLValue.bool(node.xpath_node("*[local-name()='successful']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@successful)
  end
end
