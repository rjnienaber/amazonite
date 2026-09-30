private alias Core = Amazonite::Core

module Amazonite::EC2
  class EnableImageDeregistrationProtectionRequest
    # The ID of the AMI.
    property image_id : String

    # If `true`, enforces deregistration protection for 24 hours after deregistration protection is
    # disabled.
    property with_cooldown : Bool | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @image_id : String,
      @with_cooldown : Bool | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ImageId", @image_id}

      if value = @with_cooldown
        params << {"#{prefix}WithCooldown", Core::QueryValue.bool(value)}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ImageId']")).not_nil!,
        with_cooldown: Core::XMLValue.bool(node.xpath_node("*[local-name()='WithCooldown']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@image_id, @with_cooldown, @dry_run)
  end
end
