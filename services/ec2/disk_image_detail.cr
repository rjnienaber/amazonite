private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a disk image.
  class DiskImageDetail
    # The disk image format.
    property format : DiskImageFormat

    # The size of the disk image, in GiB.
    property bytes : Int64

    # A presigned URL for the import manifest stored in Amazon S3 and presented here as an Amazon S3
    # presigned URL. For information about creating a presigned URL for an Amazon S3 object, read the
    # "Query String Request Authentication Alternative" section of the [Authenticating REST
    # Requests](https://docs.aws.amazon.com/AmazonS3/latest/dev/RESTAuthentication.html) topic in the
    # *Amazon Simple Storage Service Developer Guide*.
    #
    # For information about the import manifest referenced by this API action, see [VM Import
    # Manifest](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/manifest.html).
    property import_manifest_url : String

    def initialize(
      @format : DiskImageFormat,
      @bytes : Int64,
      @import_manifest_url : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Format", @format.to_json_object_key}

      params << {"#{prefix}Bytes", @bytes.to_s}

      params << {"#{prefix}ImportManifestUrl", @import_manifest_url}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        format: ((n = node.xpath_node("*[local-name()='format']")) ? AEC::DiskImageFormat.from_json_object_key?(n.content) : nil).not_nil!,
        bytes: Core::XMLValue.i64(node.xpath_node("*[local-name()='bytes']")).not_nil!,
        import_manifest_url: Core::XMLValue.string(node.xpath_node("*[local-name()='importManifestUrl']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@format, @bytes, @import_manifest_url)
  end
end
