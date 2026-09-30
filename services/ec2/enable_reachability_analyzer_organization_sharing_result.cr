private alias Core = Amazonite::Core

module Amazonite::EC2
  class EnableReachabilityAnalyzerOrganizationSharingResult
    # Returns `true` if the request succeeds; otherwise, returns an error.
    property return_value : Bool | Nil

    def initialize(
      @return_value : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @return_value
        params << {"#{prefix}ReturnValue", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        return_value: Core::XMLValue.bool(node.xpath_node("*[local-name()='returnValue']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@return_value)
  end
end
