private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for GetReservedInstanceExchangeQuote.
  class GetReservedInstancesExchangeQuoteRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The IDs of the Convertible Reserved Instances to exchange.
    property reserved_instance_ids : Array(String) = [] of String

    # The configuration of the target Convertible Reserved Instance to exchange for your current
    # Convertible Reserved Instances.
    property target_configurations : Array(TargetConfigurationRequest) | Nil

    def initialize(
      @reserved_instance_ids : Array(String),
      @dry_run : Bool | Nil = nil,
      @target_configurations : Array(TargetConfigurationRequest) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      @reserved_instance_ids.each_with_index(1) do |item, i|
        params << {"#{prefix}ReservedInstanceId.#{i}", item}
      end

      (@target_configurations || [] of TargetConfigurationRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TargetConfiguration.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        reserved_instance_ids: node.xpath_nodes("*[local-name()='ReservedInstanceId']/*[local-name()='ReservedInstanceId']").map { |n| n.content },
        target_configurations: node.xpath_nodes("*[local-name()='TargetConfiguration']/*[local-name()='TargetConfigurationRequest']").map { |n| TargetConfigurationRequest.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @target_configurations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @reserved_instance_ids, @target_configurations)
  end
end
