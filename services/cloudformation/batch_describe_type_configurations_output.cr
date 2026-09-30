private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  class BatchDescribeTypeConfigurationsOutput
    # A list of information concerning any errors generated during the setting of the specified
    # configurations.
    property errors : Array(BatchDescribeTypeConfigurationsError) | Nil

    # A list of any of the specified extension configurations that CloudFormation could not process
    # for any reason.
    property unprocessed_type_configurations : Array(TypeConfigurationIdentifier) | Nil

    # A list of any of the specified extension configurations from the CloudFormation registry.
    property type_configurations : Array(TypeConfigurationDetails) | Nil

    def initialize(
      @errors : Array(BatchDescribeTypeConfigurationsError) | Nil = nil,
      @unprocessed_type_configurations : Array(TypeConfigurationIdentifier) | Nil = nil,
      @type_configurations : Array(TypeConfigurationDetails) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@errors || [] of BatchDescribeTypeConfigurationsError).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Errors.member.#{i}."))
      end

      (@unprocessed_type_configurations || [] of TypeConfigurationIdentifier).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}UnprocessedTypeConfigurations.member.#{i}."))
      end

      (@type_configurations || [] of TypeConfigurationDetails).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TypeConfigurations.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        errors: node.xpath_nodes("*[local-name()='Errors']/*[local-name()='member']").map { |n| BatchDescribeTypeConfigurationsError.from_xml(n) },
        unprocessed_type_configurations: node.xpath_nodes("*[local-name()='UnprocessedTypeConfigurations']/*[local-name()='member']").map { |n| TypeConfigurationIdentifier.from_xml(n) },
        type_configurations: node.xpath_nodes("*[local-name()='TypeConfigurations']/*[local-name()='member']").map { |n| TypeConfigurationDetails.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @errors
        value.each(&.validate!)
      end

      if value = @unprocessed_type_configurations
        value.each(&.validate!)
      end

      if value = @type_configurations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@errors, @unprocessed_type_configurations, @type_configurations)
  end
end
