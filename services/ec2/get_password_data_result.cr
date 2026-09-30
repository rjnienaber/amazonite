private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetPasswordDataResult
    # The ID of the Windows instance.
    property instance_id : String | Nil

    # The time the data was last updated.
    property timestamp : Time | Nil

    # The password of the instance. Returns an empty string if the password is not available.
    property password_data : String | Nil

    def initialize(
      @instance_id : String | Nil = nil,
      @timestamp : Time | Nil = nil,
      @password_data : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @timestamp
        params << {"#{prefix}Timestamp", Core::QueryValue.time(value)}
      end

      if value = @password_data
        params << {"#{prefix}PasswordData", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='timestamp']")),
        password_data: Core::XMLValue.string(node.xpath_node("*[local-name()='passwordData']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_id, @timestamp, @password_data)
  end
end
