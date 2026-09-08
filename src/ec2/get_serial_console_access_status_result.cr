private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetSerialConsoleAccessStatusResult
    # If `true`, access to the EC2 serial console of all instances is enabled for your account. If
    # `false`, access to the EC2 serial console of all instances is disabled for your account.
    property serial_console_access_enabled : Bool | Nil

    # The entity that manages access to the serial console. Possible values include:
    #
    # - `account` - Access is managed by the account.
    #
    # - `declarative-policy` - Access is managed by a declarative policy and can't be modified by the
    # account.
    property managed_by : ManagedBy | Nil

    def initialize(
      @serial_console_access_enabled : Bool | Nil = nil,
      @managed_by : ManagedBy | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @serial_console_access_enabled
        params << {"#{prefix}SerialConsoleAccessEnabled", Core::QueryValue.bool(value)}
      end

      if value = @managed_by
        params << {"#{prefix}ManagedBy", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        serial_console_access_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='serialConsoleAccessEnabled']")),
        managed_by: (n = node.xpath_node("*[local-name()='managedBy']")) ? AEC::ManagedBy.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@serial_console_access_enabled, @managed_by)
  end
end
