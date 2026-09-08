private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for ModifyReservedInstances.
  class ModifyReservedInstancesRequest
    # The IDs of the Reserved Instances to modify.
    property reserved_instances_ids : Array(String) = [] of String

    # A unique, case-sensitive token you provide to ensure idempotency of your modification request.
    # For more information, see [Ensuring
    # Idempotency](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html).
    property client_token : String | Nil

    # The configuration settings for the Reserved Instances to modify.
    property target_configurations : Array(ReservedInstancesConfiguration) = [] of ReservedInstancesConfiguration

    def initialize(
      @reserved_instances_ids : Array(String),
      @target_configurations : Array(ReservedInstancesConfiguration),
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @reserved_instances_ids.each_with_index(1) do |item, i|
        params << {"#{prefix}ReservedInstancesId.#{i}", item}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      @target_configurations.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ReservedInstancesConfigurationSetItemType.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        reserved_instances_ids: node.xpath_nodes("*[local-name()='ReservedInstancesId']/*[local-name()='ReservedInstancesId']").map { |n| n.content },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='clientToken']")),
        target_configurations: node.xpath_nodes("*[local-name()='ReservedInstancesConfigurationSetItemType']/*[local-name()='item']").map { |n| ReservedInstancesConfiguration.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @target_configurations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@reserved_instances_ids, @client_token, @target_configurations)
  end
end
