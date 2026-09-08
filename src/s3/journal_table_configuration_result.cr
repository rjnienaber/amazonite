private alias Core = Amazonite::Core

module Amazonite::S3
  # The journal table configuration for the S3 Metadata configuration.
  class JournalTableConfigurationResult
    # The status of the journal table. The status values are:
    #
    # - `CREATING` - The journal table is in the process of being created in the specified table
    # bucket.
    #
    # - `ACTIVE` - The journal table has been created successfully, and records are being delivered to
    # the table.
    #
    # - `FAILED` - Amazon S3 is unable to create the journal table, or Amazon S3 is unable to deliver
    # records.
    property table_status : String

    property error : ErrorDetails | Nil

    # The name of the journal table.
    property table_name : String

    # The Amazon Resource Name (ARN) for the journal table.
    property table_arn : String | Nil

    # The journal table record expiration settings for the journal table.
    property record_expiration : RecordExpiration

    def initialize(
      @table_status : String,
      @table_name : String,
      @record_expiration : RecordExpiration,
      @error : ErrorDetails | Nil = nil,
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
      xml.element("TableStatus") { xml.text @table_status }

      if value = @error
        xml.element("Error") { value.build_xml(xml) }
      end

      xml.element("TableName") { xml.text @table_name }

      if value = @table_arn
        xml.element("TableArn") { xml.text value }
      end

      xml.element("RecordExpiration") { @record_expiration.build_xml(xml) }
    end

    def self.from_xml(node : XML::Node) : self
      new(
        table_status: Core::XMLValue.string(node.xpath_node("*[local-name()='TableStatus']")).not_nil!,
        error: node.xpath_node("*[local-name()='Error']").try { |n| ErrorDetails.from_xml(n) },
        table_name: Core::XMLValue.string(node.xpath_node("*[local-name()='TableName']")).not_nil!,
        table_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TableArn']")),
        record_expiration: node.xpath_node("*[local-name()='RecordExpiration']").try { |n| RecordExpiration.from_xml(n) }.not_nil!,
      )
    end

    def validate! : Nil
      if value = @error
        value.validate!
      end

      if value = @record_expiration
        value.validate!
      end
    end

    def_equals_and_hash(@table_status, @error, @table_name, @table_arn, @record_expiration)
  end
end
