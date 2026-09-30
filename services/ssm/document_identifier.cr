private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
  # Describes the name of a SSM document.
  class DocumentIdentifier
    include JSON::Serializable

    # The name of the SSM document.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The date the SSM document was created.
    @[JSON::Field(key: "CreatedDate", converter: Core::AWSEpochConverter)]
    property created_date : Time | Nil

    # An optional field where you can specify a friendly name for the SSM document. This value can
    # differ for each version of the document. If you want to update this value, see UpdateDocument.
    @[JSON::Field(key: "DisplayName")]
    property display_name : String | Nil

    # The Amazon Web Services user that created the document.
    @[JSON::Field(key: "Owner")]
    property owner : String | Nil

    # An optional field specifying the version of the artifact associated with the document. For
    # example, 12.6. This value is unique across all versions of a document, and can't be changed.
    @[JSON::Field(key: "VersionName")]
    property version_name : String | Nil

    # The operating system platform.
    @[JSON::Field(key: "PlatformTypes", converter: Core::ArrayConverter(AS::PlatformType))]
    property platform_types : Array(PlatformType) | Nil

    # The document version.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # The document type.
    @[JSON::Field(key: "DocumentType", converter: AS::DocumentType)]
    property document_type : DocumentType | Nil

    # The schema version.
    @[JSON::Field(key: "SchemaVersion")]
    property schema_version : String | Nil

    # The document format, either JSON or YAML.
    @[JSON::Field(key: "DocumentFormat", converter: AS::DocumentFormat)]
    property document_format : DocumentFormat | Nil

    # The target type which defines the kinds of resources the document can run on. For example,
    # `/AWS::EC2::Instance`. For a list of valid resource types, see [Amazon Web Services resource and
    # property types
    # reference](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html)
    # in the *CloudFormation User Guide*.
    @[JSON::Field(key: "TargetType")]
    property target_type : String | Nil

    # The tags, or metadata, that have been applied to the document.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    # A list of SSM documents required by a document. For example, an `ApplicationConfiguration`
    # document requires an `ApplicationConfigurationSchema` document.
    @[JSON::Field(key: "Requires")]
    property requires : Array(DocumentRequires) | Nil

    # The current status of a document review.
    @[JSON::Field(key: "ReviewStatus", converter: AS::ReviewStatus)]
    property review_status : ReviewStatus | Nil

    # The user in your organization who created the document.
    @[JSON::Field(key: "Author")]
    property author : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @created_date : Time | Nil = nil,
      @display_name : String | Nil = nil,
      @owner : String | Nil = nil,
      @version_name : String | Nil = nil,
      @platform_types : Array(PlatformType) | Nil = nil,
      @document_version : String | Nil = nil,
      @document_type : DocumentType | Nil = nil,
      @schema_version : String | Nil = nil,
      @document_format : DocumentFormat | Nil = nil,
      @target_type : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @requires : Array(DocumentRequires) | Nil = nil,
      @review_status : ReviewStatus | Nil = nil,
      @author : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.:/]{3,128}$"))
      end

      if value = @display_name
        raise Core::ValidationError.new("DisplayName length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("DisplayName length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("DisplayName does not match the required pattern") unless value.matches?(Regex.new("^[\\w\\.\\-\\:\\/ ]*$"))
      end

      if value = @version_name
        raise Core::ValidationError.new("VersionName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{1,128}$"))
      end

      if value = @document_version
        raise Core::ValidationError.new("DocumentVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)$"))
      end

      if value = @schema_version
        raise Core::ValidationError.new("SchemaVersion does not match the required pattern") unless value.matches?(Regex.new("^([0-9]+)\\.([0-9]+)$"))
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

      if value = @requires
        raise Core::ValidationError.new("Requires must have at least 1 item(s)") if value.size < 1
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@name, @created_date, @display_name, @owner, @version_name, @platform_types, @document_version, @document_type, @schema_version, @document_format, @target_type, @tags, @requires, @review_status, @author)
  end
end
