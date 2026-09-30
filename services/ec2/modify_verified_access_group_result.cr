private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVerifiedAccessGroupResult
    # Details about the Verified Access group.
    property verified_access_group : VerifiedAccessGroup | Nil

    def initialize(
      @verified_access_group : VerifiedAccessGroup | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @verified_access_group
        params.concat(value.to_query_params("#{prefix}VerifiedAccessGroup."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        verified_access_group: node.xpath_node("*[local-name()='verifiedAccessGroup']").try { |n| VerifiedAccessGroup.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @verified_access_group
        value.validate!
      end
    end

    def_equals_and_hash(@verified_access_group)
  end
end
