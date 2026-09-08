private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a disk image.
  class DiskImageDescription
    # The checksum computed for the disk image.
    property checksum : String | Nil

    # The disk image format.
    property format : DiskImageFormat | Nil

    # A presigned URL for the import manifest stored in Amazon S3. For information about creating a
    # presigned URL for an Amazon S3 object, read the "Query String Request Authentication
    # Alternative" section of the [Authenticating REST
    # Requests](https://docs.aws.amazon.com/AmazonS3/latest/dev/RESTAuthentication.html) topic in the
    # *Amazon Simple Storage Service Developer Guide*.
    #
    # For information about the import manifest referenced by this API action, see [VM Import
    # Manifest](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/manifest.html).
    property import_manifest_url : String | Nil

    # The size of the disk image, in GiB.
    property size : Int64 | Nil

    def initialize(
      @checksum : String | Nil = nil,
      @format : DiskImageFormat | Nil = nil,
      @import_manifest_url : String | Nil = nil,
      @size : Int64 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @checksum
        params << {"#{prefix}Checksum", value}
      end

      if value = @format
        params << {"#{prefix}Format", value.to_json_object_key}
      end

      if value = @import_manifest_url
        params << {"#{prefix}ImportManifestUrl", value}
      end

      if value = @size
        params << {"#{prefix}Size", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        checksum: Core::XMLValue.string(node.xpath_node("*[local-name()='checksum']")),
        format: (n = node.xpath_node("*[local-name()='format']")) ? AEC::DiskImageFormat.from_json_object_key?(n.content) : nil,
        import_manifest_url: Core::XMLValue.string(node.xpath_node("*[local-name()='importManifestUrl']")),
        size: Core::XMLValue.i64(node.xpath_node("*[local-name()='size']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@checksum, @format, @import_manifest_url, @size)
  end
end
