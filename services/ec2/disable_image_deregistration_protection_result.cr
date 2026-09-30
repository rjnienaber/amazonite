private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisableImageDeregistrationProtectionResult
    # Returns `true` if the request succeeds; otherwise, it returns an error.
    property return : String | Nil

    def initialize(
      @return : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @return
        params << {"#{prefix}Return", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        return: Core::XMLValue.string(node.xpath_node("*[local-name()='return']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@return)
  end
end
