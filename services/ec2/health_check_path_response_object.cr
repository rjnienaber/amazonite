private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a health check path for an application status check.
  class HealthCheckPathResponseObject
    # The source for the health check path.
    property source : HealthCheckPathSourceResponseObject | Nil

    # The destinations for the health check path.
    property destinations : Array(HealthCheckPathDestinationResponseObject) | Nil

    def initialize(
      @source : HealthCheckPathSourceResponseObject | Nil = nil,
      @destinations : Array(HealthCheckPathDestinationResponseObject) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @source
        params.concat(value.to_query_params("#{prefix}Source."))
      end

      (@destinations || [] of HealthCheckPathDestinationResponseObject).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}DestinationSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        source: node.xpath_node("*[local-name()='source']").try { |n| HealthCheckPathSourceResponseObject.from_xml(n) },
        destinations: node.xpath_nodes("*[local-name()='destinationSet']/*[local-name()='item']").map { |n| HealthCheckPathDestinationResponseObject.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @source
        value.validate!
      end

      if value = @destinations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@source, @destinations)
  end
end
