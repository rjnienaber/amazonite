private alias AEC = Amazonite::EC2

module Amazonite::EC2
  class DisableImageBlockPublicAccessResult
    # Returns `unblocked` if the request succeeds; otherwise, it returns an error.
    property image_block_public_access_state : ImageBlockPublicAccessDisabledState | Nil

    def initialize(
      @image_block_public_access_state : ImageBlockPublicAccessDisabledState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @image_block_public_access_state
        params << {"#{prefix}ImageBlockPublicAccessState", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_block_public_access_state: (n = node.xpath_node("*[local-name()='imageBlockPublicAccessState']")) ? AEC::ImageBlockPublicAccessDisabledState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@image_block_public_access_state)
  end
end
