private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Contains the bucket name, file format, bucket owner (optional), and prefix (optional) where S3
  # Inventory results are published.
  class InventoryS3BucketDestination
    # The account ID that owns the destination S3 bucket. If no account ID is provided, the owner is
    # not validated before exporting data.
    #
    # Although this value is optional, we strongly recommend that you set it to help prevent problems
    # if the destination bucket ownership changes.
    property account_id : String | Nil

    # The Amazon Resource Name (ARN) of the bucket where inventory results will be published.
    property bucket : String

    # Specifies the output format of the inventory results.
    property format : InventoryFormat

    # The prefix that is prepended to all inventory results.
    property prefix : String | Nil

    # Contains the type of server-side encryption used to encrypt the inventory results.
    property encryption : InventoryEncryption | Nil

    def initialize(
      @bucket : String,
      @format : InventoryFormat,
      @account_id : String | Nil = nil,
      @prefix : String | Nil = nil,
      @encryption : InventoryEncryption | Nil = nil,
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
      if value = @account_id
        xml.element("AccountId") { xml.text value }
      end

      xml.element("Bucket") { xml.text @bucket }

      xml.element("Format") { xml.text @format.to_json_object_key }

      if value = @prefix
        xml.element("Prefix") { xml.text value }
      end

      if value = @encryption
        xml.element("Encryption") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        account_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AccountId']")),
        bucket: Core::XMLValue.string(node.xpath_node("*[local-name()='Bucket']")).not_nil!,
        format: ((n = node.xpath_node("*[local-name()='Format']")) ? AS::InventoryFormat.from_json_object_key?(n.content) : nil).not_nil!,
        prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='Prefix']")),
        encryption: node.xpath_node("*[local-name()='Encryption']").try { |n| InventoryEncryption.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @encryption
        value.validate!
      end
    end

    def_equals_and_hash(@account_id, @bucket, @format, @prefix, @encryption)
  end
end
