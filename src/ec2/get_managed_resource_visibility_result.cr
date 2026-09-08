private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetManagedResourceVisibilityResult
    # The managed resource visibility settings for the account.
    property visibility : ManagedResourceVisibilitySettings | Nil

    def initialize(
      @visibility : ManagedResourceVisibilitySettings | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @visibility
        params.concat(value.to_query_params("#{prefix}Visibility."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        visibility: node.xpath_node("*[local-name()='visibility']").try { |n| ManagedResourceVisibilitySettings.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @visibility
        value.validate!
      end
    end

    def_equals_and_hash(@visibility)
  end
end
