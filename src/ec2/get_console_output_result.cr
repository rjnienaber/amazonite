private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetConsoleOutputResult
    # The ID of the instance.
    property instance_id : String | Nil

    # The time at which the output was last updated.
    property timestamp : Time | Nil

    # The console output, base64-encoded. If you are using a command line tool, the tool decodes the
    # output for you.
    property output : String | Nil

    def initialize(
      @instance_id : String | Nil = nil,
      @timestamp : Time | Nil = nil,
      @output : String | Nil = nil,
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

      if value = @output
        params << {"#{prefix}Output", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='timestamp']")),
        output: Core::XMLValue.string(node.xpath_node("*[local-name()='output']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_id, @timestamp, @output)
  end
end
