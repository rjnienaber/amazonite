private alias Core = Amazonite::Core

module Amazonite::EC2
  class ReleaseIpamPoolAllocationResult
    # Indicates if the release was successful.
    property success : Bool | Nil

    def initialize(
      @success : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @success
        params << {"#{prefix}Success", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        success: Core::XMLValue.bool(node.xpath_node("*[local-name()='success']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@success)
  end
end
