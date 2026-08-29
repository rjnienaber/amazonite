private alias AI = Amazonite::IamV1

module Amazonite::IamV1
  class SetSecurityTokenServicePreferencesRequest
    # The version of the global endpoint token. Version 1 tokens are valid only in Amazon Web Services
    # Regions that are available by default. These tokens do not work in manually enabled Regions,
    # such as Asia Pacific (Hong Kong). Version 2 tokens are valid in all Regions. However, version 2
    # tokens are longer and might affect systems where you temporarily store tokens.
    #
    # For information, see [Activating and deactivating STS in an Amazon Web Services
    # Region](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html)
    # in the *IAM User Guide*.
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
        global_endpoint_token_version: (n = node.xpath_node("*[local-name()='GlobalEndpointTokenVersion']")) ? AI::GlobalEndpointTokenVersion.from_json_object_key?(n.content) : nil.not_nil!,
      )
    end
  end
end
