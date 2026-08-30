private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribePublisherOutput
    # The ID of the extension publisher.
    property publisher_id : String | Nil

    # Whether the publisher is verified. Currently, all registered publishers are verified.
    property publisher_status : PublisherStatus | Nil

    # The type of account used as the identity provider when registering this publisher with
    # CloudFormation.
    property identity_provider : IdentityProvider | Nil

    # The URL to the publisher's profile with the identity provider.
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

    def_equals_and_hash(@publisher_id, @publisher_status, @identity_provider, @publisher_profile)
  end
end
