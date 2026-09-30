private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about a terminated Client VPN endpoint client connection.
  class TerminateConnectionStatus
    # The ID of the client connection.
    property connection_id : String | Nil

    # The state of the client connection.
    property previous_status : ClientVpnConnectionStatus | Nil

    # A message about the status of the client connection, if applicable.
    property current_status : ClientVpnConnectionStatus | Nil

    def initialize(
      @connection_id : String | Nil = nil,
      @previous_status : ClientVpnConnectionStatus | Nil = nil,
      @current_status : ClientVpnConnectionStatus | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @connection_id
        params << {"#{prefix}ConnectionId", value}
      end

      if value = @previous_status
        params.concat(value.to_query_params("#{prefix}PreviousStatus."))
      end

      if value = @current_status
        params.concat(value.to_query_params("#{prefix}CurrentStatus."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        connection_id: Core::XMLValue.string(node.xpath_node("*[local-name()='connectionId']")),
        previous_status: node.xpath_node("*[local-name()='previousStatus']").try { |n| ClientVpnConnectionStatus.from_xml(n) },
        current_status: node.xpath_node("*[local-name()='currentStatus']").try { |n| ClientVpnConnectionStatus.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @previous_status
        value.validate!
      end

      if value = @current_status
        value.validate!
      end
    end

    def_equals_and_hash(@connection_id, @previous_status, @current_status)
  end
end
