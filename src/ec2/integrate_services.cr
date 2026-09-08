private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes service integrations with VPC Flow logs.
  class IntegrateServices
    # Information about the integration with Amazon Athena.
    property athena_integrations : Array(AthenaIntegration) | Nil

    def initialize(
      @athena_integrations : Array(AthenaIntegration) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@athena_integrations || [] of AthenaIntegration).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AthenaIntegration.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        athena_integrations: node.xpath_nodes("*[local-name()='AthenaIntegration']/*[local-name()='item']").map { |n| AthenaIntegration.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @athena_integrations
        raise Core::ValidationError.new("AthenaIntegrations must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("AthenaIntegrations must have at most 10 item(s)") if value.size > 10
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@athena_integrations)
  end
end
