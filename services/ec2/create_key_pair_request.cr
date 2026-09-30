private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateKeyPairRequest
    # A unique name for the key pair.
    #
    # Constraints: Up to 255 ASCII characters
    property key_name : String

    # The type of key pair. Note that ED25519 keys are not supported for Windows instances.
    #
    # Default: `rsa`
    property key_type : KeyType | Nil

    # The tags to apply to the new key pair.
    property tag_specifications : Array(TagSpecification) | Nil

    # The format of the key pair.
    #
    # Default: `pem`
    property key_format : KeyFormat | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @key_name : String,
      @key_type : KeyType | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @key_format : KeyFormat | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}KeyName", @key_name}

      if value = @key_type
        params << {"#{prefix}KeyType", value.to_json_object_key}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @key_format
        params << {"#{prefix}KeyFormat", value.to_json_object_key}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        key_name: Core::XMLValue.string(node.xpath_node("*[local-name()='KeyName']")).not_nil!,
        key_type: (n = node.xpath_node("*[local-name()='KeyType']")) ? AEC::KeyType.from_json_object_key?(n.content) : nil,
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        key_format: (n = node.xpath_node("*[local-name()='KeyFormat']")) ? AEC::KeyFormat.from_json_object_key?(n.content) : nil,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@key_name, @key_type, @tag_specifications, @key_format, @dry_run)
  end
end
