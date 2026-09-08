private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisableAwsNetworkPerformanceMetricSubscriptionResult
    # Indicates whether the unsubscribe action was successful.
    property output : Bool | Nil

    def initialize(
      @output : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @output
        params << {"#{prefix}Output", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        output: Core::XMLValue.bool(node.xpath_node("*[local-name()='output']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@output)
  end
end
