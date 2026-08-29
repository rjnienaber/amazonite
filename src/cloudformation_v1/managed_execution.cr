private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ManagedExecution
    property active : Bool | Nil

    def initialize(
      @active : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @active
        params << {"#{prefix}Active", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        active: Core::XMLValue.bool(node.xpath_node("*[local-name()='Active']")),
      )
    end
  end
end
