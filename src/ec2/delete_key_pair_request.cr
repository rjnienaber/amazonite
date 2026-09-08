private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteKeyPairRequest
    # The name of the key pair.
    property key_name : String | Nil

    # The ID of the key pair.
    property key_pair_id : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @key_name : String | Nil = nil,
      @key_pair_id : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @key_name
        params << {"#{prefix}KeyName", value}
      end

      if value = @key_pair_id
        params << {"#{prefix}KeyPairId", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        key_name: Core::XMLValue.string(node.xpath_node("*[local-name()='KeyName']")),
        key_pair_id: Core::XMLValue.string(node.xpath_node("*[local-name()='KeyPairId']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@key_name, @key_pair_id, @dry_run)
  end
end
