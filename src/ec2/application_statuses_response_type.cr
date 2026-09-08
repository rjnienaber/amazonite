private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the application statuses for instances.
  class ApplicationStatusesResponseType
    # The application status information for the instances.
    property instances : Array(InstanceApplicationStatus) | Nil

    def initialize(
      @instances : Array(InstanceApplicationStatus) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@instances || [] of InstanceApplicationStatus).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}InstanceSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instances: node.xpath_nodes("*[local-name()='instanceSet']/*[local-name()='item']").map { |n| InstanceApplicationStatus.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @instances
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@instances)
  end
end
