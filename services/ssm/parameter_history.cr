private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 2048") if value.size > 2048
      end

      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("KeyId does not match the required pattern") unless value.matches?(Regex.new("^([a-zA-Z0-9:/_-]+)$"))
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 1024") if value.size > 1024
      end

      if value = @allowed_pattern
        raise Core::ValidationError.new("AllowedPattern length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("AllowedPattern length must be <= 1024") if value.size > 1024
      end

      if value = @labels
        raise Core::ValidationError.new("Labels must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Labels must have at most 10 item(s)") if value.size > 10
      end

      if value = @policies
        value.each(&.validate!)
      end

      if value = @data_type
        raise Core::ValidationError.new("DataType length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("DataType length must be <= 128") if value.size > 128
      end
    end

    def_equals_and_hash(@name, @type, @key_id, @last_modified_date, @last_modified_user, @description, @value, @allowed_pattern, @version, @labels, @tier, @policies, @data_type)
  end
end
