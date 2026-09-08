private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateNetworkInsightsPathResult
    # Information about the path.
    property network_insights_path : NetworkInsightsPath | Nil

    def initialize(
      @network_insights_path : NetworkInsightsPath | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @network_insights_path
        params.concat(value.to_query_params("#{prefix}NetworkInsightsPath."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_insights_path: node.xpath_node("*[local-name()='networkInsightsPath']").try { |n| NetworkInsightsPath.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @network_insights_path
        value.validate!
      end
    end

    def_equals_and_hash(@network_insights_path)
  end
end
