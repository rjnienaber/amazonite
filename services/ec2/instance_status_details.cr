private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the instance status.
  class InstanceStatusDetails
    # The time when a status check failed. For an instance that was launched and impaired, this is the
    # time when the instance was launched.
    property impaired_since : Time | Nil

    # The type of instance status.
    property name : StatusName | Nil

    # The status.
    property status : StatusType | Nil

    def initialize(
      @impaired_since : Time | Nil = nil,
      @name : StatusName | Nil = nil,
      @status : StatusType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @impaired_since
        params << {"#{prefix}ImpairedSince", Core::QueryValue.time(value)}
      end

      if value = @name
        params << {"#{prefix}Name", value.to_json_object_key}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        impaired_since: Core::XMLValue.time(node.xpath_node("*[local-name()='impairedSince']")),
        name: (n = node.xpath_node("*[local-name()='name']")) ? AEC::StatusName.from_json_object_key?(n.content) : nil,
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::StatusType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@impaired_since, @name, @status)
  end
end
