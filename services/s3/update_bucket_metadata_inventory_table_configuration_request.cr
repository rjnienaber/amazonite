private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class UpdateBucketMetadataInventoryTableConfigurationRequest
    # The general purpose bucket that corresponds to the metadata configuration that you want to
    # enable or disable an inventory table for.
    property bucket : String = ""

    # The `Content-MD5` header for the inventory table configuration.
    property content_md5 : String | Nil

    # The checksum algorithm to use with your inventory table configuration.
    property checksum_algorithm : ChecksumAlgorithm | Nil

    # The contents of your inventory table configuration.
    property inventory_table_configuration : InventoryTableConfigurationUpdates

    # The expected owner of the general purpose bucket that corresponds to the metadata table
    # configuration that you want to enable or disable an inventory table for.
    property expected_bucket_owner : String | Nil

    def initialize(
      @bucket : String,
      @inventory_table_configuration : InventoryTableConfigurationUpdates,
      @content_md5 : String | Nil = nil,
      @checksum_algorithm : ChecksumAlgorithm | Nil = nil,
      @expected_bucket_owner : String | Nil = nil,
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
    end

    def self.from_xml(node : XML::Node) : self
      new(
      )
    end

    def validate! : Nil
      if value = @inventory_table_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@bucket, @content_md5, @checksum_algorithm, @inventory_table_configuration, @expected_bucket_owner)
  end
end
