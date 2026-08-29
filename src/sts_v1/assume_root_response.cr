private alias Core = Amazonite::Core

module Amazonite::StsV1
  class AssumeRootResponse
    property credentials : Credentials | Nil

    property source_identity : String | Nil

    def initialize(
      @credentials : Credentials | Nil = nil,
      @source_identity : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @credentials
        params.concat(value.to_query_params("#{prefix}Credentials."))
      end

      if value = @source_identity
        params << {"#{prefix}SourceIdentity", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        credentials: node.xpath_node("*[local-name()='Credentials']").try { |n| Credentials.from_xml(n) },
        source_identity: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceIdentity']")),
      )
    end
  end
end
