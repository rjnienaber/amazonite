private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyFleetResult
    # If the request succeeds, the response returns `true`. If the request fails, no response is
    # returned, and instead an error message is returned.
    property return : Bool | Nil

    def initialize(
      @return : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @return
        params << {"#{prefix}Return", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        return: Core::XMLValue.bool(node.xpath_node("*[local-name()='return']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@return)
  end
end
