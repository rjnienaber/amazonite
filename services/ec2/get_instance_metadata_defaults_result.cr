private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetInstanceMetadataDefaultsResult
    # The account-level default IMDS settings.
    property account_level : InstanceMetadataDefaultsResponse | Nil

    def initialize(
      @account_level : InstanceMetadataDefaultsResponse | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @account_level
        params.concat(value.to_query_params("#{prefix}AccountLevel."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        account_level: node.xpath_node("*[local-name()='accountLevel']").try { |n| InstanceMetadataDefaultsResponse.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @account_level
        value.validate!
      end
    end

    def_equals_and_hash(@account_level)
  end
end
