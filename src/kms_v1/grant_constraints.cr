private alias Core = Amazonite::Core

module Amazonite::KmsV1
  # Use this structure to allow [cryptographic
  # operations](https://docs.aws.amazon.com/kms/latest/developerguide/kms-cryptography.html#cryptographic-operations)
  # in the grant only when the operation request meets the specified constraints.
  #
  # KMS supports the following grant constraints:
  #
  # - `EncryptionContextEquals` and `EncryptionContextSubset` — These encryption context constraints
  # apply only to cryptographic operations that support an encryption context, that is, all
  # cryptographic operations with a symmetric KMS key. Encryption context grant constraints are not
  # applied to operations that do not support an encryption context, such as cryptographic
  # operations with asymmetric KMS keys and management operations, such as DescribeKey or
  # RetireGrant.
  #
  # In a cryptographic operation, the encryption context in the decryption operation must be an
  # exact, case-sensitive match for the keys and values in the encryption context of the encryption
  # operation. Only the order of the pairs can vary.
  #
  # However, in a grant constraint, the key in each key-value pair is not case sensitive, but the
  # value is case sensitive.
  #
  # To avoid confusion, do not use multiple encryption context pairs that differ only by case. To
  # require a fully case-sensitive encryption context, use the `kms:EncryptionContext:` and
  # `kms:EncryptionContextKeys` conditions in an IAM or key policy. For details, see
  # [kms:EncryptionContext:context-key](https://docs.aws.amazon.com/kms/latest/developerguide/conditions-kms.html#conditions-kms-encryption-context)
  # in the * *Key Management Service Developer Guide* *.
  #
  # - `SourceArn` — This grant constraint allows the permissions in the grant only when the request
  # is made on behalf of a specific Amazon Web Services resource, identified by its [Amazon Resource
  # Name (ARN)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html). This is
  # effectively the same as having the
  # [aws:SourceArn](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_condition-keys.html#condition-keys-sourcearn)
  # global condition key in the grant. The SourceArn constraint is supported on grants for all types
  # of KMS keys and can also be applied to the DescribeKey operation when specified in the request.
  # However, it does not apply to RetireGrant operation.
  class GrantConstraints
    include JSON::Serializable

    # A list of key-value pairs that must be included in the encryption context of the [cryptographic
    # operation](https://docs.aws.amazon.com/kms/latest/developerguide/kms-cryptography.html#cryptographic-operations)
    # request. The grant allows the cryptographic operation only when the encryption context in the
    # request includes the key-value pairs specified in this constraint, although it can include
    # additional key-value pairs.
    @[JSON::Field(key: "EncryptionContextSubset")]
    property encryption_context_subset : Hash(String, String) | Nil

    # A list of key-value pairs that must match the encryption context in the [cryptographic
    # operation](https://docs.aws.amazon.com/kms/latest/developerguide/kms-cryptography.html#cryptographic-operations)
    # request. The grant allows the operation only when the encryption context in the request is the
    # same as the encryption context specified in this constraint.
    @[JSON::Field(key: "EncryptionContextEquals")]
    property encryption_context_equals : Hash(String, String) | Nil

    # The [ Amazon Resource Name
    # (ARN)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) of an Amazon
    # Web Services resource on behalf of which the request is made. This is effectively the same as
    # having the
    # [aws:SourceArn](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_condition-keys.html#condition-keys-sourcearn)
    # global condition key in the grant. The SourceArn constraint ensures that the principal can use
    # the KMS key only when the request is made on behalf of the specified resource.
    @[JSON::Field(key: "SourceArn")]
    property source_arn : String | Nil

    def initialize(
      @encryption_context_subset : Hash(String, String) | Nil = nil,
      @encryption_context_equals : Hash(String, String) | Nil = nil,
      @source_arn : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @source_arn
        raise Core::ValidationError.new("SourceArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("SourceArn length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("SourceArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[a-z0-9-]*:[a-z0-9-]+:[a-z0-9-]*:[0-9]{12}:.+$"))
      end
    end

    def_equals_and_hash(@encryption_context_subset, @encryption_context_equals, @source_arn)
  end
end
