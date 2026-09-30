private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteNetworkInsightsPathResult
    # The ID of the path.
    property network_insights_path_id : String | Nil

    def initialize(
      @network_insights_path_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @network_insights_path_id
        params << {"#{prefix}NetworkInsightsPathId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_insights_path_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInsightsPathId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@network_insights_path_id)
  end
end
