private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVerifiedAccessInstanceLoggingConfigurationResult
    # The logging configuration for the Verified Access instance.
    property logging_configuration : VerifiedAccessInstanceLoggingConfiguration | Nil

    def initialize(
      @logging_configuration : VerifiedAccessInstanceLoggingConfiguration | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @logging_configuration
        params.concat(value.to_query_params("#{prefix}LoggingConfiguration."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        logging_configuration: node.xpath_node("*[local-name()='loggingConfiguration']").try { |n| VerifiedAccessInstanceLoggingConfiguration.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @logging_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@logging_configuration)
  end
end
