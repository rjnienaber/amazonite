private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyDefaultCreditSpecificationRequest
    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The instance family.
    property instance_family : UnlimitedSupportedInstanceFamily

    # The credit option for CPU usage of the instance family.
    #
    # Valid Values: `standard` | `unlimited`
    property cpu_credits : String

    def initialize(
      @instance_family : UnlimitedSupportedInstanceFamily,
      @cpu_credits : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}InstanceFamily", @instance_family.to_json_object_key}

      params << {"#{prefix}CpuCredits", @cpu_credits}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        instance_family: ((n = node.xpath_node("*[local-name()='InstanceFamily']")) ? AEC::UnlimitedSupportedInstanceFamily.from_json_object_key?(n.content) : nil).not_nil!,
        cpu_credits: Core::XMLValue.string(node.xpath_node("*[local-name()='CpuCredits']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @instance_family, @cpu_credits)
  end
end
