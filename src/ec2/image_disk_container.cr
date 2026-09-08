private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the disk container object for an import image task.
  class ImageDiskContainer
    # The description of the disk image.
    property description : String | Nil

    # The block device mapping for the disk.
    property device_name : String | Nil

    # The format of the disk image being imported.
    #
    # Valid values: `OVA` | `VHD` | `VHDX` | `VMDK` | `RAW`
    property format : String | Nil

    # The ID of the EBS snapshot to be used for importing the snapshot.
    property snapshot_id : String | Nil

    # The URL to the Amazon S3-based disk image being imported. The URL can either be a https URL
    # (https://..) or an Amazon S3 URL (s3://..)
    property url : String | Nil

    # The S3 bucket for the disk image.
    property user_bucket : UserBucket | Nil

    def initialize(
      @description : String | Nil = nil,
      @device_name : String | Nil = nil,
      @format : String | Nil = nil,
      @snapshot_id : String | Nil = nil,
      @url : String | Nil = nil,
      @user_bucket : UserBucket | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @device_name
        params << {"#{prefix}DeviceName", value}
      end

      if value = @format
        params << {"#{prefix}Format", value}
      end

      if value = @snapshot_id
        params << {"#{prefix}SnapshotId", value}
      end

      if value = @url
        params << {"#{prefix}Url", value}
      end

      if value = @user_bucket
        params.concat(value.to_query_params("#{prefix}UserBucket."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        device_name: Core::XMLValue.string(node.xpath_node("*[local-name()='DeviceName']")),
        format: Core::XMLValue.string(node.xpath_node("*[local-name()='Format']")),
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SnapshotId']")),
        url: Core::XMLValue.string(node.xpath_node("*[local-name()='Url']")),
        user_bucket: node.xpath_node("*[local-name()='UserBucket']").try { |n| UserBucket.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @user_bucket
        value.validate!
      end
    end

    def_equals_and_hash(@description, @device_name, @format, @snapshot_id, @url, @user_bucket)
  end
end
