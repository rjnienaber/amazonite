private alias Core = Amazonite::Core

module Amazonite::S3
  # The V1 S3 Metadata configuration for a general purpose bucket.
  #
  # If you created your S3 Metadata configuration before July 15, 2025, we recommend that you delete
  # and re-create your configuration by using
  # [CreateBucketMetadataConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucketMetadataConfiguration.html)
  # so that you can expire journal table records and create a live inventory table.
  class GetBucketMetadataTableConfigurationResult
    # The V1 S3 Metadata configuration for a general purpose bucket.
    property metadata_table_configuration_result : MetadataTableConfigurationResult

    # The status of the metadata table. The status values are:
    #
    # - `CREATING` - The metadata table is in the process of being created in the specified table
    # bucket.
    #
    # - `ACTIVE` - The metadata table has been created successfully, and records are being delivered
    # to the table.
    #
    # - `FAILED` - Amazon S3 is unable to create the metadata table, or Amazon S3 is unable to deliver
    # records. See `ErrorDetails` for details.
    property status : String

    # If the `CreateBucketMetadataTableConfiguration` request succeeds, but S3 Metadata was unable to
    # create the table, this structure contains the error code and error message.
    property error : ErrorDetails | Nil

    def initialize(
      @metadata_table_configuration_result : MetadataTableConfigurationResult,
      @status : String,
      @error : ErrorDetails | Nil = nil,
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
      xml.element("MetadataTableConfigurationResult") { @metadata_table_configuration_result.build_xml(xml) }

      xml.element("Status") { xml.text @status }

      if value = @error
        xml.element("Error") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        metadata_table_configuration_result: node.xpath_node("*[local-name()='MetadataTableConfigurationResult']").try { |n| MetadataTableConfigurationResult.from_xml(n) }.not_nil!,
        status: Core::XMLValue.string(node.xpath_node("*[local-name()='Status']")).not_nil!,
        error: node.xpath_node("*[local-name()='Error']").try { |n| ErrorDetails.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @metadata_table_configuration_result
        value.validate!
      end

      if value = @error
        value.validate!
      end
    end

    def_equals_and_hash(@metadata_table_configuration_result, @status, @error)
  end
end
