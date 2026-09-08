private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Describes an Amazon S3 location that will receive the results of the restore request.
  class S3Location
    # The name of the bucket where the restore results will be placed.
    property bucket_name : String

    # The prefix that is prepended to the restore results for this request.
    property prefix : String

    property encryption : Encryption | Nil

    # The canned ACL to apply to the restore results.
    property canned_acl : ObjectCannedACL | Nil

    # A list of grants that control access to the staged results.
    property access_control_list : Array(Grant) | Nil

    # The tag-set that is applied to the restore results.
    property tagging : Tagging | Nil

    # A list of metadata to store with the restore results in S3.
    property user_metadata : Array(MetadataEntry) | Nil

    # The class of storage used to store the restore results.
    property storage_class : StorageClass | Nil

    def initialize(
      @bucket_name : String,
      @prefix : String,
      @encryption : Encryption | Nil = nil,
      @canned_acl : ObjectCannedACL | Nil = nil,
      @access_control_list : Array(Grant) | Nil = nil,
      @tagging : Tagging | Nil = nil,
      @user_metadata : Array(MetadataEntry) | Nil = nil,
      @storage_class : StorageClass | Nil = nil,
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
      xml.element("BucketName") { xml.text @bucket_name }

      xml.element("Prefix") { xml.text @prefix }

      if value = @encryption
        xml.element("Encryption") { value.build_xml(xml) }
      end

      if value = @canned_acl
        xml.element("CannedACL") { xml.text value.to_json_object_key }
      end

      xml.element("AccessControlList") do
        (@access_control_list || [] of Grant).each do |item|
          xml.element("Grant") { item.build_xml(xml) }
        end
      end

      if value = @tagging
        xml.element("Tagging") { value.build_xml(xml) }
      end

      xml.element("UserMetadata") do
        (@user_metadata || [] of MetadataEntry).each do |item|
          xml.element("MetadataEntry") { item.build_xml(xml) }
        end
      end

      if value = @storage_class
        xml.element("StorageClass") { xml.text value.to_json_object_key }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        bucket_name: Core::XMLValue.string(node.xpath_node("*[local-name()='BucketName']")).not_nil!,
        prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='Prefix']")).not_nil!,
        encryption: node.xpath_node("*[local-name()='Encryption']").try { |n| Encryption.from_xml(n) },
        canned_acl: (n = node.xpath_node("*[local-name()='CannedACL']")) ? AS::ObjectCannedACL.from_json_object_key?(n.content) : nil,
        access_control_list: node.xpath_nodes("*[local-name()='AccessControlList']/*[local-name()='Grant']").map { |n| Grant.from_xml(n) },
        tagging: node.xpath_node("*[local-name()='Tagging']").try { |n| Tagging.from_xml(n) },
        user_metadata: node.xpath_nodes("*[local-name()='UserMetadata']/*[local-name()='MetadataEntry']").map { |n| MetadataEntry.from_xml(n) },
        storage_class: (n = node.xpath_node("*[local-name()='StorageClass']")) ? AS::StorageClass.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @encryption
        value.validate!
      end

      if value = @access_control_list
        value.each(&.validate!)
      end

      if value = @tagging
        value.validate!
      end

      if value = @user_metadata
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@bucket_name, @prefix, @encryption, @canned_acl, @access_control_list, @tagging, @user_metadata, @storage_class)
  end
end
