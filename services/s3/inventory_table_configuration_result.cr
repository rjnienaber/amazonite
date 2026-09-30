private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # The inventory table configuration for an S3 Metadata configuration.
  class InventoryTableConfigurationResult
    # The configuration state of the inventory table, indicating whether the inventory table is
    # enabled or disabled.
    property configuration_state : InventoryConfigurationState

    # The status of the inventory table. The status values are:
    #
    # - `CREATING` - The inventory table is in the process of being created in the specified Amazon
    # Web Services managed table bucket.
    #
    # - `BACKFILLING` - The inventory table is in the process of being backfilled. When you enable the
    # inventory table for your metadata configuration, the table goes through a process known as
    # backfilling, during which Amazon S3 scans your general purpose bucket to retrieve the initial
    # metadata for all objects in the bucket. Depending on the number of objects in your bucket, this
    # process can take several hours. When the backfilling process is finished, the status of your
    # inventory table changes from `BACKFILLING` to `ACTIVE`. After backfilling is completed, updates
    # to your objects are reflected in the inventory table within one hour.
    #
    # - `ACTIVE` - The inventory table has been created successfully, and records are being delivered
    # to the table.
    #
    # - `FAILED` - Amazon S3 is unable to create the inventory table, or Amazon S3 is unable to
    # deliver records.
    property table_status : String | Nil

    property error : ErrorDetails | Nil

    # The name of the inventory table.
    property table_name : String | Nil

    # The Amazon Resource Name (ARN) for the inventory table.
    property table_arn : String | Nil

    def initialize(
      @configuration_state : InventoryConfigurationState,
      @table_status : String | Nil = nil,
      @error : ErrorDetails | Nil = nil,
      @table_name : String | Nil = nil,
      @table_arn : String | Nil = nil,
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
      xml.element("ConfigurationState") { xml.text @configuration_state.to_json_object_key }

      if value = @table_status
        xml.element("TableStatus") { xml.text value }
      end

      if value = @error
        xml.element("Error") { value.build_xml(xml) }
      end

      if value = @table_name
        xml.element("TableName") { xml.text value }
      end

      if value = @table_arn
        xml.element("TableArn") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        configuration_state: ((n = node.xpath_node("*[local-name()='ConfigurationState']")) ? AS::InventoryConfigurationState.from_json_object_key?(n.content) : nil).not_nil!,
        table_status: Core::XMLValue.string(node.xpath_node("*[local-name()='TableStatus']")),
        error: node.xpath_node("*[local-name()='Error']").try { |n| ErrorDetails.from_xml(n) },
        table_name: Core::XMLValue.string(node.xpath_node("*[local-name()='TableName']")),
        table_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TableArn']")),
      )
    end

    def validate! : Nil
      if value = @error
        value.validate!
      end
    end

    def_equals_and_hash(@configuration_state, @table_status, @error, @table_name, @table_arn)
  end
end
