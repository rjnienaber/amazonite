private alias Core = Amazonite::Core

module Amazonite::EC2
  # Indicates whether the instance is enabled for Amazon Web Services Nitro Enclaves. For more
  # information, see [What is Nitro
  # Enclaves?](https://docs.aws.amazon.com/enclaves/latest/user/nitro-enclave.html) in the *Amazon
  # Web Services Nitro Enclaves User Guide*.
  class LaunchTemplateEnclaveOptionsRequest
    # To enable the instance for Amazon Web Services Nitro Enclaves, set this parameter to `true`.
    property enabled : Bool | Nil

    def initialize(
      @enabled : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @enabled
        params << {"#{prefix}Enabled", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='Enabled']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@enabled)
  end
end
