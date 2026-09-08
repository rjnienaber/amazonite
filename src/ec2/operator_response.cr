private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes whether the resource is managed by a service provider and, if so, describes the
  # service provider that manages it.
  class OperatorResponse
    # If `true`, the resource is managed by a service provider.
    property managed : Bool | Nil

    # If `managed` is `true`, then the principal is returned. The principal is the service provider
    # that manages the resource.
    property principal : String | Nil

    # If `true`, the resource is hidden by default based on the managed resource visibility settings
    # for the account.
    property hidden_by_default : Bool | Nil

    def initialize(
      @managed : Bool | Nil = nil,
      @principal : String | Nil = nil,
      @hidden_by_default : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @managed
        params << {"#{prefix}Managed", Core::QueryValue.bool(value)}
      end

      if value = @principal
        params << {"#{prefix}Principal", value}
      end

      if value = @hidden_by_default
        params << {"#{prefix}HiddenByDefault", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        managed: Core::XMLValue.bool(node.xpath_node("*[local-name()='managed']")),
        principal: Core::XMLValue.string(node.xpath_node("*[local-name()='principal']")),
        hidden_by_default: Core::XMLValue.bool(node.xpath_node("*[local-name()='hiddenByDefault']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@managed, @principal, @hidden_by_default)
  end
end
