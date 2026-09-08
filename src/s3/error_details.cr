private alias Core = Amazonite::Core

module Amazonite::S3
  # If an S3 Metadata V1 `CreateBucketMetadataTableConfiguration` or V2
  # `CreateBucketMetadataConfiguration` request succeeds, but S3 Metadata was unable to create the
  # table, this structure contains the error code and error message.
  #
  # If you created your S3 Metadata configuration before July 15, 2025, we recommend that you delete
  # and re-create your configuration by using
  # [CreateBucketMetadataConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucketMetadataConfiguration.html)
  # so that you can expire journal table records and create a live inventory table.
  class ErrorDetails
    # If the V1 `CreateBucketMetadataTableConfiguration` request succeeds, but S3 Metadata was unable
    # to create the table, this structure contains the error code. The possible error codes and error
    # messages are as follows:
    #
    # - `AccessDeniedCreatingResources` - You don't have sufficient permissions to create the required
    # resources. Make sure that you have `s3tables:CreateNamespace`, `s3tables:CreateTable`,
    # `s3tables:GetTable` and `s3tables:PutTablePolicy` permissions, and then try again. To create a
    # new metadata table, you must delete the metadata configuration for this bucket, and then create
    # a new metadata configuration.
    #
    # - `AccessDeniedWritingToTable` - Unable to write to the metadata table because of missing
    # resource permissions. To fix the resource policy, Amazon S3 needs to create a new metadata
    # table. To create a new metadata table, you must delete the metadata configuration for this
    # bucket, and then create a new metadata configuration.
    #
    # - `DestinationTableNotFound` - The destination table doesn't exist. To create a new metadata
    # table, you must delete the metadata configuration for this bucket, and then create a new
    # metadata configuration.
    #
    # - `ServerInternalError` - An internal error has occurred. To create a new metadata table, you
    # must delete the metadata configuration for this bucket, and then create a new metadata
    # configuration.
    #
    # - `TableAlreadyExists` - The table that you specified already exists in the table bucket's
    # namespace. Specify a different table name. To create a new metadata table, you must delete the
    # metadata configuration for this bucket, and then create a new metadata configuration.
    #
    # - `TableBucketNotFound` - The table bucket that you specified doesn't exist in this Amazon Web
    # Services Region and account. Create or choose a different table bucket. To create a new metadata
    # table, you must delete the metadata configuration for this bucket, and then create a new
    # metadata configuration.
    #
    # If the V2 `CreateBucketMetadataConfiguration` request succeeds, but S3 Metadata was unable to
    # create the table, this structure contains the error code. The possible error codes and error
    # messages are as follows:
    #
    # - `AccessDeniedCreatingResources` - You don't have sufficient permissions to create the required
    # resources. Make sure that you have `s3tables:CreateTableBucket`, `s3tables:CreateNamespace`,
    # `s3tables:CreateTable`, `s3tables:GetTable`, `s3tables:PutTablePolicy`, `kms:DescribeKey`, and
    # `s3tables:PutTableEncryption` permissions. Additionally, ensure that the KMS key used to encrypt
    # the table still exists, is active and has a resource policy granting access to the S3 service
    # principals '`maintenance.s3tables.amazonaws.com`' and '`metadata.s3.amazonaws.com`'. To create a
    # new metadata table, you must delete the metadata configuration for this bucket, and then create
    # a new metadata configuration.
    #
    # - `AccessDeniedWritingToTable` - Unable to write to the metadata table because of missing
    # resource permissions. To fix the resource policy, Amazon S3 needs to create a new metadata
    # table. To create a new metadata table, you must delete the metadata configuration for this
    # bucket, and then create a new metadata configuration.
    #
    # - `DestinationTableNotFound` - The destination table doesn't exist. To create a new metadata
    # table, you must delete the metadata configuration for this bucket, and then create a new
    # metadata configuration.
    #
    # - `ServerInternalError` - An internal error has occurred. To create a new metadata table, you
    # must delete the metadata configuration for this bucket, and then create a new metadata
    # configuration.
    #
    # - `JournalTableAlreadyExists` - A journal table already exists in the Amazon Web Services
    # managed table bucket's namespace. Delete the journal table, and then try again. To create a new
    # metadata table, you must delete the metadata configuration for this bucket, and then create a
    # new metadata configuration.
    #
    # - `InventoryTableAlreadyExists` - An inventory table already exists in the Amazon Web Services
    # managed table bucket's namespace. Delete the inventory table, and then try again. To create a
    # new metadata table, you must delete the metadata configuration for this bucket, and then create
    # a new metadata configuration.
    #
    # - `JournalTableNotAvailable` - The journal table that the inventory table relies on has a
    # `FAILED` status. An inventory table requires a journal table with an `ACTIVE` status. To create
    # a new journal or inventory table, you must delete the metadata configuration for this bucket,
    # along with any journal or inventory tables, and then create a new metadata configuration.
    #
    # - `NoSuchBucket` - The specified general purpose bucket does not exist.
    property error_code : String | Nil

    # If the V1 `CreateBucketMetadataTableConfiguration` request succeeds, but S3 Metadata was unable
    # to create the table, this structure contains the error message. The possible error codes and
    # error messages are as follows:
    #
    # - `AccessDeniedCreatingResources` - You don't have sufficient permissions to create the required
    # resources. Make sure that you have `s3tables:CreateNamespace`, `s3tables:CreateTable`,
    # `s3tables:GetTable` and `s3tables:PutTablePolicy` permissions, and then try again. To create a
    # new metadata table, you must delete the metadata configuration for this bucket, and then create
    # a new metadata configuration.
    #
    # - `AccessDeniedWritingToTable` - Unable to write to the metadata table because of missing
    # resource permissions. To fix the resource policy, Amazon S3 needs to create a new metadata
    # table. To create a new metadata table, you must delete the metadata configuration for this
    # bucket, and then create a new metadata configuration.
    #
    # - `DestinationTableNotFound` - The destination table doesn't exist. To create a new metadata
    # table, you must delete the metadata configuration for this bucket, and then create a new
    # metadata configuration.
    #
    # - `ServerInternalError` - An internal error has occurred. To create a new metadata table, you
    # must delete the metadata configuration for this bucket, and then create a new metadata
    # configuration.
    #
    # - `TableAlreadyExists` - The table that you specified already exists in the table bucket's
    # namespace. Specify a different table name. To create a new metadata table, you must delete the
    # metadata configuration for this bucket, and then create a new metadata configuration.
    #
    # - `TableBucketNotFound` - The table bucket that you specified doesn't exist in this Amazon Web
    # Services Region and account. Create or choose a different table bucket. To create a new metadata
    # table, you must delete the metadata configuration for this bucket, and then create a new
    # metadata configuration.
    #
    # If the V2 `CreateBucketMetadataConfiguration` request succeeds, but S3 Metadata was unable to
    # create the table, this structure contains the error code. The possible error codes and error
    # messages are as follows:
    #
    # - `AccessDeniedCreatingResources` - You don't have sufficient permissions to create the required
    # resources. Make sure that you have `s3tables:CreateTableBucket`, `s3tables:CreateNamespace`,
    # `s3tables:CreateTable`, `s3tables:GetTable`, `s3tables:PutTablePolicy`, `kms:DescribeKey`, and
    # `s3tables:PutTableEncryption` permissions. Additionally, ensure that the KMS key used to encrypt
    # the table still exists, is active and has a resource policy granting access to the S3 service
    # principals '`maintenance.s3tables.amazonaws.com`' and '`metadata.s3.amazonaws.com`'. To create a
    # new metadata table, you must delete the metadata configuration for this bucket, and then create
    # a new metadata configuration.
    #
    # - `AccessDeniedWritingToTable` - Unable to write to the metadata table because of missing
    # resource permissions. To fix the resource policy, Amazon S3 needs to create a new metadata
    # table. To create a new metadata table, you must delete the metadata configuration for this
    # bucket, and then create a new metadata configuration.
    #
    # - `DestinationTableNotFound` - The destination table doesn't exist. To create a new metadata
    # table, you must delete the metadata configuration for this bucket, and then create a new
    # metadata configuration.
    #
    # - `ServerInternalError` - An internal error has occurred. To create a new metadata table, you
    # must delete the metadata configuration for this bucket, and then create a new metadata
    # configuration.
    #
    # - `JournalTableAlreadyExists` - A journal table already exists in the Amazon Web Services
    # managed table bucket's namespace. Delete the journal table, and then try again. To create a new
    # metadata table, you must delete the metadata configuration for this bucket, and then create a
    # new metadata configuration.
    #
    # - `InventoryTableAlreadyExists` - An inventory table already exists in the Amazon Web Services
    # managed table bucket's namespace. Delete the inventory table, and then try again. To create a
    # new metadata table, you must delete the metadata configuration for this bucket, and then create
    # a new metadata configuration.
    #
    # - `JournalTableNotAvailable` - The journal table that the inventory table relies on has a
    # `FAILED` status. An inventory table requires a journal table with an `ACTIVE` status. To create
    # a new journal or inventory table, you must delete the metadata configuration for this bucket,
    # along with any journal or inventory tables, and then create a new metadata configuration.
    #
    # - `NoSuchBucket` - The specified general purpose bucket does not exist.
    property error_message : String | Nil

    def initialize(
      @error_code : String | Nil = nil,
      @error_message : String | Nil = nil,
    )
    end

    # `root` is the element this shape is serialized under, which restXml
    # takes from the member binding it as the request payload rather than
    # from the shape's own name - they differ often enough (S3 sends a
    # CompletedMultipartUpload as <CompleteMultipartUpload>) that the caller
    # has to supply it.
    def to_xml(root : String) : String
      XML.build(indent: nil) do |xml|
        xml.element(root) { build_xml(xml) }
      end
    end

    def build_xml(xml : XML::Builder) : Nil
      if value = @error_code
        xml.element("ErrorCode") { xml.text value }
      end

      if value = @error_message
        xml.element("ErrorMessage") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        error_code: Core::XMLValue.string(node.xpath_node("*[local-name()='ErrorCode']")),
        error_message: Core::XMLValue.string(node.xpath_node("*[local-name()='ErrorMessage']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@error_code, @error_message)
  end
end
