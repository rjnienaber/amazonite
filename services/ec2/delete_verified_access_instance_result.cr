private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteVerifiedAccessInstanceResult
    # Details about the Verified Access instance.
    property verified_access_instance : VerifiedAccessInstance | Nil

    def initialize(
      @verified_access_instance : VerifiedAccessInstance | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @verified_access_instance
        params.concat(value.to_query_params("#{prefix}VerifiedAccessInstance."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        verified_access_instance: node.xpath_node("*[local-name()='verifiedAccessInstance']").try { |n| VerifiedAccessInstance.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @verified_access_instance
        value.validate!
      end
    end

    def_equals_and_hash(@verified_access_instance)
  end
end
