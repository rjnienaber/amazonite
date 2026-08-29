private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribePublisherOutput
    property publisher_id : String | Nil

    property publisher_status : PublisherStatus | Nil

    property identity_provider : IdentityProvider | Nil

    property publisher_profile : String | Nil

    def initialize(
      @publisher_id : String | Nil = nil,
      @publisher_status : PublisherStatus | Nil = nil,
      @identity_provider : IdentityProvider | Nil = nil,
      @publisher_profile : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @publisher_id
        params << {"#{prefix}PublisherId", value}
      end

      if value = @publisher_status
        params << {"#{prefix}PublisherStatus", value.to_json_object_key}
      end

      if value = @identity_provider
        params << {"#{prefix}IdentityProvider", value.to_json_object_key}
      end

      if value = @publisher_profile
        params << {"#{prefix}PublisherProfile", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        publisher_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PublisherId']")),
        publisher_status: (n = node.xpath_node("*[local-name()='PublisherStatus']")) ? ACF::PublisherStatus.from_json_object_key?(n.content) : nil,
        identity_provider: (n = node.xpath_node("*[local-name()='IdentityProvider']")) ? ACF::IdentityProvider.from_json_object_key?(n.content) : nil,
        publisher_profile: Core::XMLValue.string(node.xpath_node("*[local-name()='PublisherProfile']")),
      )
    end
  end
end
