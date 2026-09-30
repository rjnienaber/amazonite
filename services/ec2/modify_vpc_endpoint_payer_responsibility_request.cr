private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVpcEndpointPayerResponsibilityRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the VPC endpoint service.
    property service_id : String | Nil

    # The ID of the VPC endpoint.
    property vpc_endpoint_id : String

    # The Amazon Web Services account to which the usage of VPC endpoint is charged.
    property payer_responsibility : PayerResponsibilityType

    # The scope of usage/charges for which the billing account is being modified.
    property scope : PayerResponsibilityScope

    def initialize(
      @vpc_endpoint_id : String,
      @payer_responsibility : PayerResponsibilityType,
      @scope : PayerResponsibilityScope,
      @dry_run : Bool | Nil = nil,
      @service_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @service_id
        params << {"#{prefix}ServiceId", value}
      end

      params << {"#{prefix}VpcEndpointId", @vpc_endpoint_id}

      params << {"#{prefix}PayerResponsibility", @payer_responsibility.to_json_object_key}

      params << {"#{prefix}Scope", @scope.to_json_object_key}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        service_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceId']")),
        vpc_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpcEndpointId']")).not_nil!,
        payer_responsibility: ((n = node.xpath_node("*[local-name()='PayerResponsibility']")) ? AEC::PayerResponsibilityType.from_json_object_key?(n.content) : nil).not_nil!,
        scope: ((n = node.xpath_node("*[local-name()='Scope']")) ? AEC::PayerResponsibilityScope.from_json_object_key?(n.content) : nil).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @service_id, @vpc_endpoint_id, @payer_responsibility, @scope)
  end
end
