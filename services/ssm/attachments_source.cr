private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
  # Identifying information about a document attachment, including the file name and a key-value
  # pair that identifies the location of an attachment to a document.
  class AttachmentsSource
    include JSON::Serializable

    # The key of a key-value pair that identifies the location of an attachment to a document.
    @[JSON::Field(key: "Key", converter: AS::AttachmentsSourceKey)]
    property key : AttachmentsSourceKey | Nil

    # The value of a key-value pair that identifies the location of an attachment to a document. The
    # format for **Value** depends on the type of key you specify.
    #
    # - For the key *SourceUrl*, the value is an S3 bucket location. For example:
    #
    # `"Values": [ "s3://amzn-s3-demo-bucket/my-prefix" ]`
    #
    # - For the key *S3FileUrl*, the value is a file in an S3 bucket. For example:
    #
    # `"Values": [ "s3://amzn-s3-demo-bucket/my-prefix/my-file.py" ]`
    #
    # - For the key *AttachmentReference*, the value is constructed from the name of another SSM
    # document in your account, a version number of that document, and a file attached to that
    # document version that you want to reuse. For example:
    #
    # `"Values": [ "MyOtherDocument/3/my-other-file.py" ]`
    #
    # However, if the SSM document is shared with you from another account, the full SSM document ARN
    # must be specified instead of the document name only. For example:
    #
    # `"Values": [ "arn:aws:ssm:us-east-2:111122223333:document/OtherAccountDocument/3/their-file.py"
    # ]`
    @[JSON::Field(key: "Values")]
    property values : Array(String) | Nil

    # The name of the document attachment file.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    def initialize(
      @key : AttachmentsSourceKey | Nil = nil,
      @values : Array(String) | Nil = nil,
      @name : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @values
        raise Core::ValidationError.new("Values must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Values must have at most 1 item(s)") if value.size > 1
      end

      if value = @name
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{3,128}$"))
      end
    end

    def_equals_and_hash(@key, @values, @name)
  end
end
