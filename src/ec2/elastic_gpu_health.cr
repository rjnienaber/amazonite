private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # Amazon Elastic Graphics reached end of life on January 8, 2024.
  #
  # Describes the status of an Elastic Graphics accelerator.
  class ElasticGpuHealth
    # The health status.
    property status : ElasticGpuStatus | Nil

    def initialize(
      @status : ElasticGpuStatus | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::ElasticGpuStatus.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@status)
  end
end
