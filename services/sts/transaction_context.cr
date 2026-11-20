module Amazonite::Sts
  # The session's `aws:TransactionContext/IdentityProvider/*` keys.
  class TransactionContext
    # The session's `aws:TransactionContext/IdentityProvider/*` keys, keyed by the part of the key
    # name after `aws:TransactionContext/IdentityProvider/`. Each value is up to 128 characters.
    #
    # The number of entries is bounded twice. IAM limits how many keys a context provider maps when
    # you configure it on the identity provider, and Amazon Web Services STS rejects a session whose
    # session token exceeds the maximum size with `PackedPolicyTooLarge`.
    property identity_provider : Hash(String, String) | Nil

    def initialize(
      @identity_provider : Hash(String, String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@identity_provider || {} of String => String).each_with_index(1) do |(key, value), i|
        params << {"#{prefix}IdentityProvider.entry.#{i}.key", key}
        params << {"#{prefix}IdentityProvider.entry.#{i}.value", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        identity_provider: node.xpath_nodes("*[local-name()='IdentityProvider']/*[local-name()='entry']").each_with_object({} of String => String) { |entry, hash| hash[entry.xpath_node("*[local-name()='key']").not_nil!.content] = entry.xpath_node("*[local-name()='value']").not_nil!.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@identity_provider)
  end
end
