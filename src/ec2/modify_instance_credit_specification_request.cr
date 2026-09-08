private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyInstanceCreditSpecificationRequest
    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # A unique, case-sensitive token that you provide to ensure idempotency of your modification
    # request. For more information, see [Ensuring
    # Idempotency](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html).
    property client_token : String | Nil

    # Information about the credit option for CPU usage.
    property instance_credit_specifications : Array(InstanceCreditSpecificationRequest) = [] of InstanceCreditSpecificationRequest

    def initialize(
      @instance_credit_specifications : Array(InstanceCreditSpecificationRequest),
      @dry_run : Bool | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      @instance_credit_specifications.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}InstanceCreditSpecification.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        instance_credit_specifications: node.xpath_nodes("*[local-name()='InstanceCreditSpecification']/*[local-name()='item']").map { |n| InstanceCreditSpecificationRequest.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @instance_credit_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @client_token, @instance_credit_specifications)
  end
end
