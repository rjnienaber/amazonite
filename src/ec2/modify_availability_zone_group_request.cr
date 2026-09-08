private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyAvailabilityZoneGroupRequest
    # The name of the Availability Zone group, Local Zone group, or Wavelength Zone group.
    property group_name : String

    # Indicates whether to opt in to the zone group. The only valid value is `opted-in`. You must
    # contact Amazon Web Services Support to opt out of a Local Zone or Wavelength Zone group.
    property opt_in_status : ModifyAvailabilityZoneOptInStatus

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @group_name : String,
      @opt_in_status : ModifyAvailabilityZoneOptInStatus,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}GroupName", @group_name}

      params << {"#{prefix}OptInStatus", @opt_in_status.to_json_object_key}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupName']")).not_nil!,
        opt_in_status: ((n = node.xpath_node("*[local-name()='OptInStatus']")) ? AEC::ModifyAvailabilityZoneOptInStatus.from_json_object_key?(n.content) : nil).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@group_name, @opt_in_status, @dry_run)
  end
end
