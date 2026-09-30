private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVpcEndpointServicePayerResponsibilityRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the service.
    property service_id : String

    # The entity that is responsible for the endpoint costs. The default is the endpoint owner. If you
    # set the payer responsibility to the service owner, you cannot set it back to the endpoint owner.
    property payer_responsibility : PayerResponsibility

    def initialize(
      @service_id : String,
      @payer_responsibility : PayerResponsibility,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}ServiceId", @service_id}

      params << {"#{prefix}PayerResponsibility", @payer_responsibility.to_json_object_key}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        service_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceId']")).not_nil!,
        payer_responsibility: ((n = node.xpath_node("*[local-name()='PayerResponsibility']")) ? AEC::PayerResponsibility.from_json_object_key?(n.content) : nil).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @service_id, @payer_responsibility)
  end
end
