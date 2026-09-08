private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the encryption support status for a transit gateway.
  class EncryptionSupport
    # The current encryption state of the resource.
    property encryption_state : EncryptionStateValue | Nil

    # A message describing the encryption state.
    property state_message : String | Nil

    def initialize(
      @encryption_state : EncryptionStateValue | Nil = nil,
      @state_message : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @encryption_state
        params << {"#{prefix}EncryptionState", value.to_json_object_key}
      end

      if value = @state_message
        params << {"#{prefix}StateMessage", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        encryption_state: (n = node.xpath_node("*[local-name()='encryptionState']")) ? AEC::EncryptionStateValue.from_json_object_key?(n.content) : nil,
        state_message: Core::XMLValue.string(node.xpath_node("*[local-name()='stateMessage']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@encryption_state, @state_message)
  end
end
