private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyManagedResourceVisibilityRequest
    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The default visibility setting for managed resources. Valid values: `hidden` | `visible`.
    property default_visibility : ManagedResourceDefaultVisibility

    def initialize(
      @default_visibility : ManagedResourceDefaultVisibility,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}DefaultVisibility", @default_visibility.to_json_object_key}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        default_visibility: ((n = node.xpath_node("*[local-name()='DefaultVisibility']")) ? AEC::ManagedResourceDefaultVisibility.from_json_object_key?(n.content) : nil).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @default_visibility)
  end
end
