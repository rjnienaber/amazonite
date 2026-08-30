private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class TestTypeInput
    # The Amazon Resource Name (ARN) of the extension.
    #
    # Conditional: You must specify `Arn`, or `TypeName` and `Type`.
    property arn : String | Nil

    # The type of the extension to test.
    #
    # Conditional: You must specify `Arn`, or `TypeName` and `Type`.
    property type : ThirdPartyType | Nil

    # The name of the extension to test.
    #
    # Conditional: You must specify `Arn`, or `TypeName` and `Type`.
    property type_name : String | Nil

    # The version of the extension to test.
    #
    # You can specify the version id with either `Arn`, or with `TypeName` and `Type`.
    #
    # If you don't specify a version, CloudFormation uses the default version of the extension in this
    # account and Region for testing.
    property version_id : String | Nil

    # The S3 bucket to which CloudFormation delivers the contract test execution logs.
    #
    # CloudFormation delivers the logs by the time contract testing has completed and the extension
    # has been assigned a test type status of `PASSED` or `FAILED`.
    #
    # The user calling `TestType` must be able to access items in the specified S3 bucket.
    # Specifically, the user needs the following permissions:
    #
    # - `GetObject`
    #
    # - `PutObject`
    #
    # For more information, see [Actions, Resources, and Condition Keys for Amazon
    # S3](https://docs.aws.amazon.com/service-authorization/latest/reference/list_amazons3.html) in
    # the *Identity and Access Management User Guide*.
    property log_delivery_bucket : String | Nil

    def initialize(
      @arn : String | Nil = nil,
      @type : ThirdPartyType | Nil = nil,
      @type_name : String | Nil = nil,
      @version_id : String | Nil = nil,
      @log_delivery_bucket : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @arn
        params << {"#{prefix}Arn", value}
      end

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end

      if value = @type_name
        params << {"#{prefix}TypeName", value}
      end

      if value = @version_id
        params << {"#{prefix}VersionId", value}
      end

      if value = @log_delivery_bucket
        params << {"#{prefix}LogDeliveryBucket", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")),
        type: (n = node.xpath_node("*[local-name()='Type']")) ? ACF::ThirdPartyType.from_json_object_key?(n.content) : nil,
        type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeName']")),
        version_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VersionId']")),
        log_delivery_bucket: Core::XMLValue.string(node.xpath_node("*[local-name()='LogDeliveryBucket']")),
      )
    end

    def validate! : Nil
      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Arn length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("Arn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[A-Za-z0-9-]{0,64}:cloudformation:[A-Za-z0-9-]{1,64}:([0-9]{12})?:type/.+$"))
      end

      if value = @type_name
        raise Core::ValidationError.new("TypeName length must be >= 10") if value.size < 10
        raise Core::ValidationError.new("TypeName length must be <= 204") if value.size > 204
        raise Core::ValidationError.new("TypeName does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}(::MODULE){0,1}$"))
      end

      if value = @version_id
        raise Core::ValidationError.new("VersionId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("VersionId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("VersionId does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9-]+$"))
      end

      if value = @log_delivery_bucket
        raise Core::ValidationError.new("LogDeliveryBucket length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("LogDeliveryBucket length must be <= 63") if value.size > 63
        raise Core::ValidationError.new("LogDeliveryBucket does not match the required pattern") unless value.matches?(Regex.new("^[\\s\\S]+$"))
      end
    end

    def_equals_and_hash(@arn, @type, @type_name, @version_id, @log_delivery_bucket)
  end
end
