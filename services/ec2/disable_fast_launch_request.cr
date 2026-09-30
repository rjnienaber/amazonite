private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisableFastLaunchRequest
    # Specify the ID of the image for which to disable Windows fast launch.
    property image_id : String

    # Forces the image settings to turn off Windows fast launch for your Windows AMI. This parameter
    # overrides any errors that are encountered while cleaning up resources in your account.
    property force : Bool | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @image_id : String,
      @force : Bool | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ImageId", @image_id}

      if value = @force
        params << {"#{prefix}Force", Core::QueryValue.bool(value)}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ImageId']")).not_nil!,
        force: Core::XMLValue.bool(node.xpath_node("*[local-name()='Force']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@image_id, @force, @dry_run)
  end
end
