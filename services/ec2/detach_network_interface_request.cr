private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for DetachNetworkInterface.
  class DetachNetworkInterfaceRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the attachment.
    property attachment_id : String

    # Specifies whether to force a detachment.
    #
    # - Use the `Force` parameter only as a last resort to detach a network interface from a failed
    # instance.
    #
    # - If you use the `Force` parameter to detach a network interface, you might not be able to
    # attach a different network interface to the same index on the instance without first stopping
    # and starting the instance.
    #
    # - If you force the detachment of a network interface, the [instance
    # metadata](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html) might
    # not get updated. This means that the attributes associated with the detached network interface
    # might still be visible. The instance metadata will get updated when you stop and start the
    # instance.
    property force : Bool | Nil

    def initialize(
      @attachment_id : String,
      @dry_run : Bool | Nil = nil,
      @force : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}AttachmentId", @attachment_id}

      if value = @force
        params << {"#{prefix}Force", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='attachmentId']")).not_nil!,
        force: Core::XMLValue.bool(node.xpath_node("*[local-name()='force']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @attachment_id, @force)
  end
end
