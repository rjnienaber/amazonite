private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # Describes the type of service for a VPC endpoint.
  class ServiceTypeDetail
    # The type of service.
    property service_type : ServiceType | Nil

    def initialize(
      @service_type : ServiceType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @service_type
        params << {"#{prefix}ServiceType", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        service_type: (n = node.xpath_node("*[local-name()='serviceType']")) ? AEC::ServiceType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@service_type)
  end
end
