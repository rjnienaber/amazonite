private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Information about parameter usage.
  class ParameterHistory
    include JSON::Serializable

    # The name of the parameter.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The type of parameter used.
    @[JSON::Field(key: "Type", converter: AS::ParameterType)]
    property type : ParameterType | Nil

    # The alias of the Key Management Service (KMS) key used to encrypt the parameter. Applies to
    # `SecureString` parameters only
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    # Date the parameter was last changed or updated.
    @[JSON::Field(key: "LastModifiedDate", converter: Core::AWSEpochConverter)]
    property last_modified_date : Time | Nil

    # Amazon Resource Name (ARN) of the Amazon Web Services user who last changed the parameter.
    @[JSON::Field(key: "LastModifiedUser")]
    property last_modified_user : String | Nil

    # Information about the parameter.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The parameter value.
    @[JSON::Field(key: "Value")]
    property value : String | Nil

    # Parameter names can include the following letters and symbols.
    #
    # a-zA-Z0-9_.-
    @[JSON::Field(key: "AllowedPattern")]
    property allowed_pattern : String | Nil

    # The parameter version.
    @[JSON::Field(key: "Version")]
    property version : Int64 | Nil

    # Labels assigned to the parameter version.
    @[JSON::Field(key: "Labels")]
    property labels : Array(String) | Nil

    # The parameter tier.
    @[JSON::Field(key: "Tier", converter: AS::ParameterTier)]
    property tier : ParameterTier | Nil

    # Information about the policies assigned to a parameter.
    #
    # [Assigning parameter
    # policies](https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-policies.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "Policies")]
    property policies : Array(ParameterInlinePolicy) | Nil

    # The data type of the parameter, such as `text` or `aws:ec2:image`. The default is `text`.
    @[JSON::Field(key: "DataType")]
    property data_type : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @type : ParameterType | Nil = nil,
      @key_id : String | Nil = nil,
      @last_modified_date : Time | Nil = nil,
      @last_modified_user : String | Nil = nil,
      @description : String | Nil = nil,
      @value : String | Nil = nil,
      @allowed_pattern : String | Nil = nil,
      @version : Int64 | Nil = nil,
      @labels : Array(String) | Nil = nil,
      @tier : ParameterTier | Nil = nil,
      @policies : Array(ParameterInlinePolicy) | Nil = nil,
      @data_type : String | Nil = nil,
    )
    end

    def_equals_and_hash(@name, @type, @key_id, @last_modified_date, @last_modified_user, @description, @value, @allowed_pattern, @version, @labels, @tier, @policies, @data_type)
  end
end
