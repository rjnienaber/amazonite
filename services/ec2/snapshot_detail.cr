private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the snapshot created from the imported disk.
  class SnapshotDetail
    # A description for the snapshot.
    property description : String | Nil

    # The block device mapping for the snapshot.
    property device_name : String | Nil

    # The size of the disk in the snapshot, in GiB.
    property disk_image_size : Float64 | Nil

    # The format of the disk image from which the snapshot is created.
    property format : String | Nil

    # The percentage of progress for the task.
    property progress : String | Nil

    # The snapshot ID of the disk being imported.
    property snapshot_id : String | Nil

    # A brief status of the snapshot creation.
    property status : String | Nil

    # A detailed status message for the snapshot creation.
    property status_message : String | Nil

    # The URL used to access the disk image.
    property url : String | Nil

    # The Amazon S3 bucket for the disk image.
    property user_bucket : UserBucketDetails | Nil

    def initialize(
      @description : String | Nil = nil,
      @device_name : String | Nil = nil,
      @disk_image_size : Float64 | Nil = nil,
      @format : String | Nil = nil,
      @progress : String | Nil = nil,
      @snapshot_id : String | Nil = nil,
      @status : String | Nil = nil,
      @status_message : String | Nil = nil,
      @url : String | Nil = nil,
      @user_bucket : UserBucketDetails | Nil = nil,
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

      if value = @disk_image_size
        params << {"#{prefix}DiskImageSize", value.to_s}
      end

      if value = @format
        params << {"#{prefix}Format", value}
      end

      if value = @progress
        params << {"#{prefix}Progress", value}
      end

      if value = @snapshot_id
        params << {"#{prefix}SnapshotId", value}
      end

      if value = @status
        params << {"#{prefix}Status", value}
      end

      if value = @status_message
        params << {"#{prefix}StatusMessage", value}
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
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        device_name: Core::XMLValue.string(node.xpath_node("*[local-name()='deviceName']")),
        disk_image_size: Core::XMLValue.f64(node.xpath_node("*[local-name()='diskImageSize']")),
        format: Core::XMLValue.string(node.xpath_node("*[local-name()='format']")),
        progress: Core::XMLValue.string(node.xpath_node("*[local-name()='progress']")),
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='snapshotId']")),
        status: Core::XMLValue.string(node.xpath_node("*[local-name()='status']")),
        status_message: Core::XMLValue.string(node.xpath_node("*[local-name()='statusMessage']")),
        url: Core::XMLValue.string(node.xpath_node("*[local-name()='url']")),
        user_bucket: node.xpath_node("*[local-name()='userBucket']").try { |n| UserBucketDetails.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @user_bucket
        value.validate!
      end
    end

    def_equals_and_hash(@description, @device_name, @disk_image_size, @format, @progress, @snapshot_id, @status, @status_message, @url, @user_bucket)
  end
end
