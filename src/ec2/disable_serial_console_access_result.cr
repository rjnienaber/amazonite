private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisableSerialConsoleAccessResult
    # If `true`, access to the EC2 serial console of all instances is enabled for your account. If
    # `false`, access to the EC2 serial console of all instances is disabled for your account.
    property serial_console_access_enabled : Bool | Nil

    def initialize(
      @serial_console_access_enabled : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @serial_console_access_enabled
        params << {"#{prefix}SerialConsoleAccessEnabled", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        serial_console_access_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='serialConsoleAccessEnabled']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@serial_console_access_enabled)
  end
end
