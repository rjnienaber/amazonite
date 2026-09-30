private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an error that occurred when enabling fast snapshot restores.
  class EnableFastSnapshotRestoreStateError
    # The error code.
    property code : String | Nil

    # The error message.
    property message : String | Nil

    def initialize(
      @code : String | Nil = nil,
      @message : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @code
        params << {"#{prefix}Code", value}
      end

      if value = @message
        params << {"#{prefix}Message", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        code: Core::XMLValue.string(node.xpath_node("*[local-name()='code']")),
        message: Core::XMLValue.string(node.xpath_node("*[local-name()='message']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@code, @message)
  end
end
