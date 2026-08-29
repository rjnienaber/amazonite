private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class TypeSummary
    property type : RegistryType | Nil

    property type_name : String | Nil

    property default_version_id : String | Nil

    property type_arn : String | Nil

    property last_updated : Time | Nil

    property description : String | Nil

    property publisher_id : String | Nil

    property original_type_name : String | Nil

    property public_version_number : String | Nil

    property latest_public_version : String | Nil

    property publisher_identity : IdentityProvider | Nil

    property publisher_name : String | Nil

    property is_activated : Bool | Nil

    def initialize(
      @type : RegistryType | Nil = nil,
      @type_name : String | Nil = nil,
      @default_version_id : String | Nil = nil,
      @type_arn : String | Nil = nil,
      @last_updated : Time | Nil = nil,
      @description : String | Nil = nil,
      @publisher_id : String | Nil = nil,
      @original_type_name : String | Nil = nil,
      @public_version_number : String | Nil = nil,
      @latest_public_version : String | Nil = nil,
      @publisher_identity : IdentityProvider | Nil = nil,
      @publisher_name : String | Nil = nil,
      @is_activated : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end

      if value = @type_name
        params << {"#{prefix}TypeName", value}
      end

      if value = @default_version_id
        params << {"#{prefix}DefaultVersionId", value}
      end

      if value = @type_arn
        params << {"#{prefix}TypeArn", value}
      end

      if value = @last_updated
        params << {"#{prefix}LastUpdated", Core::QueryValue.time(value)}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @publisher_id
        params << {"#{prefix}PublisherId", value}
      end

      if value = @original_type_name
        params << {"#{prefix}OriginalTypeName", value}
      end

      if value = @public_version_number
        params << {"#{prefix}PublicVersionNumber", value}
      end

      if value = @latest_public_version
        params << {"#{prefix}LatestPublicVersion", value}
      end

      if value = @publisher_identity
        params << {"#{prefix}PublisherIdentity", value.to_json_object_key}
      end

      if value = @publisher_name
        params << {"#{prefix}PublisherName", value}
      end

      if value = @is_activated
        params << {"#{prefix}IsActivated", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type: (n = node.xpath_node("*[local-name()='Type']")) ? ACF::RegistryType.from_json_object_key?(n.content) : nil,
        type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeName']")),
        default_version_id: Core::XMLValue.string(node.xpath_node("*[local-name()='DefaultVersionId']")),
        type_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeArn']")),
        last_updated: Core::XMLValue.time(node.xpath_node("*[local-name()='LastUpdated']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        publisher_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PublisherId']")),
        original_type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='OriginalTypeName']")),
        public_version_number: Core::XMLValue.string(node.xpath_node("*[local-name()='PublicVersionNumber']")),
        latest_public_version: Core::XMLValue.string(node.xpath_node("*[local-name()='LatestPublicVersion']")),
        publisher_identity: (n = node.xpath_node("*[local-name()='PublisherIdentity']")) ? ACF::IdentityProvider.from_json_object_key?(n.content) : nil,
        publisher_name: Core::XMLValue.string(node.xpath_node("*[local-name()='PublisherName']")),
        is_activated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsActivated']")),
      )
    end
  end
end
