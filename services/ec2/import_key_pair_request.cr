private alias Core = Amazonite::Core

module Amazonite::EC2
  class ImportKeyPairRequest
    # The tags to apply to the imported key pair.
    property tag_specifications : Array(TagSpecification) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # A unique name for the key pair.
    property key_name : String

    # The public key.
    property public_key_material : Bytes

    def initialize(
      @key_name : String,
      @public_key_material : Bytes,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}KeyName", @key_name}

      params << {"#{prefix}PublicKeyMaterial", Core::QueryValue.bytes(@public_key_material)}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        key_name: Core::XMLValue.string(node.xpath_node("*[local-name()='keyName']")).not_nil!,
        public_key_material: Core::XMLValue.bytes(node.xpath_node("*[local-name()='publicKeyMaterial']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@tag_specifications, @dry_run, @key_name, @public_key_material)
  end
end
