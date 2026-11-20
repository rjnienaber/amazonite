private alias Core = Amazonite::Core

module Amazonite::Sts
  # The trusted identity propagation context that Amazon Web Services STS set in a session from the
  # identity provider's token. A member is absent when the session has none of its keys.
  class TrustedIdentityPropagationContext
    # The identity of the end user on whose behalf the session acts.
    property origin_identity : OriginIdentity | Nil

    # Additional claims about the request that the identity provider asserted.
    property transaction_context : TransactionContext | Nil

    def initialize(
      @origin_identity : OriginIdentity | Nil = nil,
      @transaction_context : TransactionContext | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @origin_identity
        params.concat(value.to_query_params("#{prefix}OriginIdentity."))
      end

      if value = @transaction_context
        params.concat(value.to_query_params("#{prefix}TransactionContext."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        origin_identity: node.xpath_node("*[local-name()='OriginIdentity']").try { |n| OriginIdentity.from_xml(n) },
        transaction_context: node.xpath_node("*[local-name()='TransactionContext']").try { |n| TransactionContext.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @origin_identity
        value.validate!
      end

      if value = @transaction_context
        value.validate!
      end
    end

    def_equals_and_hash(@origin_identity, @transaction_context)
  end
end
