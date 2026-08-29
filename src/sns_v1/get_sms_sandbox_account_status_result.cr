private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class GetSMSSandboxAccountStatusResult
    # Indicates whether the calling Amazon Web Services account is in the SMS sandbox.
    property is_in_sandbox : Bool

    def initialize(
      @is_in_sandbox : Bool,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}IsInSandbox", Core::QueryValue.bool(@is_in_sandbox)}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        is_in_sandbox: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsInSandbox']")).not_nil!,
      )
    end
  end
end
