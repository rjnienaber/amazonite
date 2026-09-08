private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class EnableImageBlockPublicAccessRequest
    # Specify `block-new-sharing` to enable block public access for AMIs at the account level in the
    # specified Region. This will block any attempt to publicly share your AMIs in the specified
    # Region.
    property image_block_public_access_state : ImageBlockPublicAccessEnabledState

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @image_block_public_access_state : ImageBlockPublicAccessEnabledState,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ImageBlockPublicAccessState", @image_block_public_access_state.to_json_object_key}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_block_public_access_state: ((n = node.xpath_node("*[local-name()='ImageBlockPublicAccessState']")) ? AEC::ImageBlockPublicAccessEnabledState.from_json_object_key?(n.content) : nil).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@image_block_public_access_state, @dry_run)
  end
end
