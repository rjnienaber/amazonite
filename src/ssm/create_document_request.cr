private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
  class CreateDocumentRequest
    include JSON::Serializable

    # The content for the new SSM document in JSON or YAML format. The content of the document must
    # not exceed 64KB. This quota also includes the content specified for input parameters at runtime.
    # We recommend storing the contents for your new document in an external JSON or YAML file and
    # referencing the file in a command.
    #
    # For examples, see the following topics in the *Amazon Web Services Systems Manager User Guide*.
    #
    # - [Create an SSM document
    # (console)](https://docs.aws.amazon.com/systems-manager/latest/userguide/documents-using.html#create-ssm-console)
    #
    # - [Create an SSM document (command
    # line)](https://docs.aws.amazon.com/systems-manager/latest/userguide/documents-using.html#create-ssm-document-cli)
    #
    # - [Create an SSM document
    # (API)](https://docs.aws.amazon.com/systems-manager/latest/userguide/documents-using.html#create-ssm-document-api)
    @[JSON::Field(key: "Content")]
    property content : String

    # A list of SSM documents required by a document. This parameter is used exclusively by AppConfig.
    # When a user creates an AppConfig configuration in an SSM document, the user must also specify a
    # required document for validation purposes. In this case, an `ApplicationConfiguration` document
    # requires an `ApplicationConfigurationSchema` document for validation purposes. For more
    # information, see [What is
    # AppConfig?](https://docs.aws.amazon.com/appconfig/latest/userguide/what-is-appconfig.html) in
    # the *AppConfig User Guide*.
    @[JSON::Field(key: "Requires")]
    property requires : Array(DocumentRequires) | Nil

    # A list of key-value pairs that describe attachments to a version of a document.
    @[JSON::Field(key: "Attachments")]
    property attachments : Array(AttachmentsSource) | Nil

    # A name for the SSM document.
    #
    # You can't use the following strings as document name prefixes. These are reserved by Amazon Web
    # Services for use as document name prefixes:
    #
    # - `aws`
    #
    # - `amazon`
    #
    # - `amzn`
    #
    # - `AWSEC2`
    #
    # - `AWSConfigRemediation`
    #
    # - `AWSSupport`
    @[JSON::Field(key: "Name")]
    property name : String

    # An optional field where you can specify a friendly name for the SSM document. This value can
    # differ for each version of the document. You can update this value at a later time using the
    # UpdateDocument operation.
    @[JSON::Field(key: "DisplayName")]
    property display_name : String | Nil

    # An optional field specifying the version of the artifact you are creating with the document. For
    # example, `Release12.1`. This value is unique across all versions of a document, and can't be
    # changed.
    @[JSON::Field(key: "VersionName")]
    property version_name : String | Nil

    # The type of document to create.
    #
    # The `DeploymentStrategy` document type is an internal-use-only document type reserved for
    # AppConfig.
    @[JSON::Field(key: "DocumentType", converter: AS::DocumentType)]
    property document_type : DocumentType | Nil

    # Specify the document format for the request. The document format can be JSON, YAML, or TEXT.
    # JSON is the default format.
    @[JSON::Field(key: "DocumentFormat", converter: AS::DocumentFormat)]
    property document_format : DocumentFormat | Nil

    # Specify a target type to define the kinds of resources the document can run on. For example, to
    # run a document on EC2 instances, specify the following value: `/AWS::EC2::Instance`. If you
    # specify a value of '/' the document can run on all types of resources. If you don't specify a
    # value, the document can't run on any resources. For a list of valid resource types, see [Amazon
    # Web Services resource and property types
    # reference](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html)
    # in the *CloudFormation User Guide*.
    @[JSON::Field(key: "TargetType")]
    property target_type : String | Nil

    # Optional metadata that you assign to a resource. Tags enable you to categorize a resource in
    # different ways, such as by purpose, owner, or environment. For example, you might want to tag an
    # SSM document to identify the types of targets or the environment where it will run. In this
    # case, you could specify the following key-value pairs:
    #
    # - `Key=OS,Value=Windows`
    #
    # - `Key=Environment,Value=Production`
    #
    # To add tags to an existing SSM document, use the AddTagsToResource operation.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    def initialize(
      @content : String,
      @name : String,
      @requires : Array(DocumentRequires) | Nil = nil,
      @attachments : Array(AttachmentsSource) | Nil = nil,
      @display_name : String | Nil = nil,
      @version_name : String | Nil = nil,
      @document_type : DocumentType | Nil = nil,
      @document_format : DocumentFormat | Nil = nil,
      @target_type : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @content
        raise Core::ValidationError.new("Content length must be >= 1") if value.size < 1
      end

      if value = @requires
        raise Core::ValidationError.new("Requires must have at least 1 item(s)") if value.size < 1
        value.each(&.validate!)
      end

      if value = @attachments
        raise Core::ValidationError.new("Attachments must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Attachments must have at most 20 item(s)") if value.size > 20
        value.each(&.validate!)
      end

      if value = @name
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{3,128}$"))
      end

      if value = @display_name
        raise Core::ValidationError.new("DisplayName length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("DisplayName length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("DisplayName does not match the required pattern") unless value.matches?(Regex.new("^[\\w\\.\\-\\:\\/ ]*$"))
      end

      if value = @version_name
        raise Core::ValidationError.new("VersionName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{1,128}$"))
      end

      if value = @target_type
        raise Core::ValidationError.new("TargetType length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("TargetType length must be <= 200") if value.size > 200
        raise Core::ValidationError.new("TargetType does not match the required pattern") unless value.matches?(Regex.new("^\\/[\\w\\.\\-\\:\\/]*$"))
      end

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Tags must have at most 1000 item(s)") if value.size > 1000
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@content, @requires, @attachments, @name, @display_name, @version_name, @document_type, @document_format, @target_type, @tags)
  end
end
