private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class DisableOrganizationsRootSessionsResponse
    # The unique identifier (ID) of an organization.
    property organization_id : String | Nil

    # The features you have enabled for centralized root access of member accounts in your
    # organization.
    property enabled_features : Array(FeatureType) | Nil

    def initialize(
      @organization_id : String | Nil = nil,
      @enabled_features : Array(FeatureType) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @organization_id
        params << {"#{prefix}OrganizationId", value}
      end

      (@enabled_features || [] of FeatureType).each_with_index(1) do |item, i|
        params << {"#{prefix}EnabledFeatures.member.#{i}", item.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        organization_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OrganizationId']")),
        enabled_features: node.xpath_nodes("*[local-name()='EnabledFeatures']/*[local-name()='member']").compact_map { |n| AI::FeatureType.from_json_object_key?(n.content) },
      )
    end

    def_equals_and_hash(@organization_id, @enabled_features)
  end
end
