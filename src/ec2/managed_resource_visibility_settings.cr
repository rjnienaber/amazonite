private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # Describes the managed resource visibility settings for the account.
  class ManagedResourceVisibilitySettings
    # The default visibility setting for managed resources. A value of `hidden` indicates that managed
    # resources are not included in Describe operation responses by default. A value of `visible`
    # indicates that managed resources are included by default.
    property default_visibility : ManagedResourceDefaultVisibility | Nil

    def initialize(
      @default_visibility : ManagedResourceDefaultVisibility | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @default_visibility
        params << {"#{prefix}DefaultVisibility", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        default_visibility: (n = node.xpath_node("*[local-name()='defaultVisibility']")) ? AEC::ManagedResourceDefaultVisibility.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@default_visibility)
  end
end
