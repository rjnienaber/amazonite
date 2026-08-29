module Amazonite::CloudFormationV1
  class BatchDescribeTypeConfigurationsInput
    property type_configuration_identifiers : Array(TypeConfigurationIdentifier) = [] of TypeConfigurationIdentifier

    def initialize(
      @type_configuration_identifiers : Array(TypeConfigurationIdentifier),
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @type_configuration_identifiers.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TypeConfigurationIdentifiers.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type_configuration_identifiers: node.xpath_nodes("*[local-name()='TypeConfigurationIdentifiers']/*[local-name()='member']").map { |n| TypeConfigurationIdentifier.from_xml(n) },
      )
    end
  end
end
