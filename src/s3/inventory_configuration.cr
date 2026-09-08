private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies the S3 Inventory configuration for an Amazon S3 bucket. For more information, see [GET
  # Bucket
  # inventory](https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketGETInventoryConfig.html) in
  # the *Amazon S3 API Reference*.
  class InventoryConfiguration
    # Contains information about where to publish the inventory results.
    property destination : InventoryDestination

    # Specifies whether the inventory is enabled or disabled. If set to `True`, an inventory list is
    # generated. If set to `False`, no inventory list is generated.
    property is_enabled : Bool

    # Specifies an inventory filter. The inventory only includes objects that meet the filter's
    # criteria.
    property filter : InventoryFilter | Nil

    # The ID used to identify the inventory configuration.
    property id : String

    # Object versions to include in the inventory list. If set to `All`, the list includes all the
    # object versions, which adds the version-related fields `VersionId`, `IsLatest`, and
    # `DeleteMarker` to the list. If set to `Current`, the list does not contain these version-related
    # fields.
    property included_object_versions : InventoryIncludedObjectVersions

    # Contains the optional fields that are included in the inventory results.
    #
    # The following optional fields are supported for directory buckets `Size | LastModifiedDate |
    # StorageClass | ETag | IsMultipartUploaded | EncryptionStatus | BucketKeyStatus |
    # ChecksumAlgorithm | LifecycleExpirationDate.` Throws MalformedXML error if unsupported optional
    # field is provided.
    property optional_fields : Array(InventoryOptionalField) | Nil

    # Specifies the schedule for generating inventory results.
    property schedule : InventorySchedule

    def initialize(
      @destination : InventoryDestination,
      @is_enabled : Bool,
      @id : String,
      @included_object_versions : InventoryIncludedObjectVersions,
      @schedule : InventorySchedule,
      @filter : InventoryFilter | Nil = nil,
      @optional_fields : Array(InventoryOptionalField) | Nil = nil,
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
      xml.element("Destination") { @destination.build_xml(xml) }

      xml.element("IsEnabled") { xml.text Core::QueryValue.bool(@is_enabled) }

      if value = @filter
        xml.element("Filter") { value.build_xml(xml) }
      end

      xml.element("Id") { xml.text @id }

      xml.element("IncludedObjectVersions") { xml.text @included_object_versions.to_json_object_key }

      xml.element("OptionalFields") do
        (@optional_fields || [] of InventoryOptionalField).each do |item|
          xml.element("Field") { xml.text item.to_json_object_key }
        end
      end

      xml.element("Schedule") { @schedule.build_xml(xml) }
    end

    def self.from_xml(node : XML::Node) : self
      new(
        destination: node.xpath_node("*[local-name()='Destination']").try { |n| InventoryDestination.from_xml(n) }.not_nil!,
        is_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsEnabled']")).not_nil!,
        filter: node.xpath_node("*[local-name()='Filter']").try { |n| InventoryFilter.from_xml(n) },
        id: Core::XMLValue.string(node.xpath_node("*[local-name()='Id']")).not_nil!,
        included_object_versions: ((n = node.xpath_node("*[local-name()='IncludedObjectVersions']")) ? AS::InventoryIncludedObjectVersions.from_json_object_key?(n.content) : nil).not_nil!,
        optional_fields: node.xpath_nodes("*[local-name()='OptionalFields']/*[local-name()='Field']").compact_map { |n| AS::InventoryOptionalField.from_json_object_key?(n.content) },
        schedule: node.xpath_node("*[local-name()='Schedule']").try { |n| InventorySchedule.from_xml(n) }.not_nil!,
      )
    end

    def validate! : Nil
      if value = @destination
        value.validate!
      end

      if value = @filter
        value.validate!
      end

      if value = @schedule
        value.validate!
      end
    end

    def_equals_and_hash(@destination, @is_enabled, @filter, @id, @included_object_versions, @optional_fields, @schedule)
  end
end
