private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a supported Region.
  class SupportedRegionDetail
    # The Region code.
    property region : String | Nil

    # The service state. The possible values are `Pending`, `Available`, `Deleting`, `Deleted`,
    # `Failed`, and `Closed`.
    property service_state : String | Nil

    def initialize(
      @region : String | Nil = nil,
      @service_state : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @region
        params << {"#{prefix}Region", value}
      end

      if value = @service_state
        params << {"#{prefix}ServiceState", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        region: Core::XMLValue.string(node.xpath_node("*[local-name()='region']")),
        service_state: Core::XMLValue.string(node.xpath_node("*[local-name()='serviceState']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@region, @service_state)
  end
end
