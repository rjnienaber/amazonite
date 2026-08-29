private alias AI = Amazonite::IamV1

module Amazonite::IamV1
  class SetSecurityTokenServicePreferencesRequest
    property global_endpoint_token_version : GlobalEndpointTokenVersion

    def initialize(
      @global_endpoint_token_version : GlobalEndpointTokenVersion,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}GlobalEndpointTokenVersion", @global_endpoint_token_version.to_json_object_key}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        global_endpoint_token_version: ((n = node.xpath_node("*[local-name()='GlobalEndpointTokenVersion']")) ? AI::GlobalEndpointTokenVersion.from_json_object_key?(n.content) : nil).not_nil!,
      )
    end
  end
end
