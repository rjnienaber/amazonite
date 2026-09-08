private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for DeregisterImage.
  class DeregisterImageRequest
    # The ID of the AMI.
    property image_id : String

    # Specifies whether to delete the snapshots associated with the AMI during deregistration.
    #
    # If a snapshot is associated with multiple AMIs, it is not deleted, regardless of this setting.
    #
    # Default: The snapshots are not deleted.
    property delete_associated_snapshots : Bool | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @image_id : String,
      @delete_associated_snapshots : Bool | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ImageId", @image_id}

      if value = @delete_associated_snapshots
        params << {"#{prefix}DeleteAssociatedSnapshots", Core::QueryValue.bool(value)}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ImageId']")).not_nil!,
        delete_associated_snapshots: Core::XMLValue.bool(node.xpath_node("*[local-name()='DeleteAssociatedSnapshots']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@image_id, @delete_associated_snapshots, @dry_run)
  end
end
