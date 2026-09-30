private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeKeyPairsRequest
    # The key pair names.
    #
    # Default: Describes all of your key pairs.
    property key_names : Array(String) | Nil

    # The IDs of the key pairs.
    property key_pair_ids : Array(String) | Nil

    # If `true`, the public key material is included in the response.
    #
    # Default: `false`
    property include_public_key : Bool | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The filters.
    #
    # - `key-pair-id` - The ID of the key pair.
    #
    # - `fingerprint` - The fingerprint of the key pair.
    #
    # - `key-name` - The name of the key pair.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # assigned a tag with a specific key, regardless of the tag value.
    #
    # - `tag`: - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    property filters : Array(Filter) | Nil

    def initialize(
      @key_names : Array(String) | Nil = nil,
      @key_pair_ids : Array(String) | Nil = nil,
      @include_public_key : Bool | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@key_names || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}KeyName.#{i}", item}
      end

      (@key_pair_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}KeyPairId.#{i}", item}
      end

      if value = @include_public_key
        params << {"#{prefix}IncludePublicKey", Core::QueryValue.bool(value)}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        key_names: node.xpath_nodes("*[local-name()='KeyName']/*[local-name()='KeyName']").map { |n| n.content },
        key_pair_ids: node.xpath_nodes("*[local-name()='KeyPairId']/*[local-name()='KeyPairId']").map { |n| n.content },
        include_public_key: Core::XMLValue.bool(node.xpath_node("*[local-name()='IncludePublicKey']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@key_names, @key_pair_ids, @include_public_key, @dry_run, @filters)
  end
end
