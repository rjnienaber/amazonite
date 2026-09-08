private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetImageBlockPublicAccessStateResult
    # The current state of block public access for AMIs at the account level in the specified Amazon
    # Web Services Region.
    #
    # Possible values:
    #
    # - `block-new-sharing` - Any attempt to publicly share your AMIs in the specified Region is
    # blocked.
    #
    # - `unblocked` - Your AMIs in the specified Region can be publicly shared.
    property image_block_public_access_state : String | Nil

    # The entity that manages the state for block public access for AMIs. Possible values include:
    #
    # - `account` - The state is managed by the account.
    #
    # - `declarative-policy` - The state is managed by a declarative policy and can't be modified by
    # the account.
    property managed_by : ManagedBy | Nil

    def initialize(
      @image_block_public_access_state : String | Nil = nil,
      @managed_by : ManagedBy | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @image_block_public_access_state
        params << {"#{prefix}ImageBlockPublicAccessState", value}
      end

      if value = @managed_by
        params << {"#{prefix}ManagedBy", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_block_public_access_state: Core::XMLValue.string(node.xpath_node("*[local-name()='imageBlockPublicAccessState']")),
        managed_by: (n = node.xpath_node("*[local-name()='managedBy']")) ? AEC::ManagedBy.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@image_block_public_access_state, @managed_by)
  end
end
