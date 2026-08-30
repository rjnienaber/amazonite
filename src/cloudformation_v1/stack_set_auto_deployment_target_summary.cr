private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # One of the targets for the StackSet. Returned by the
  # [ListStackSetAutoDeploymentTargets](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ListStackSetAutoDeploymentTargets.html)
  # API operation.
  class StackSetAutoDeploymentTargetSummary
    # The organization root ID or organizational unit (OU) IDs where the StackSet is targeted.
    property organizational_unit_id : String | Nil

    # The list of Regions targeted for this organization or OU.
    property regions : Array(String) | Nil

    def initialize(
      @organizational_unit_id : String | Nil = nil,
      @regions : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @organizational_unit_id
        params << {"#{prefix}OrganizationalUnitId", value}
      end

      (@regions || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Regions.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        organizational_unit_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OrganizationalUnitId']")),
        regions: node.xpath_nodes("*[local-name()='Regions']/*[local-name()='member']").map { |n| n.content },
      )
    end

    def_equals_and_hash(@organizational_unit_id, @regions)
  end
end
