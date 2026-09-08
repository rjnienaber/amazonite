private alias Core = Amazonite::Core

module Amazonite::EC2
  # Details about the import snapshot task.
  class SnapshotTaskDetail
    # The description of the disk image being imported.
    property description : String | Nil

    # The size of the disk in the snapshot, in GiB.
    property disk_image_size : Float64 | Nil

    # Indicates whether the snapshot is encrypted.
    property encrypted : Bool | Nil

    # The format of the disk image from which the snapshot is created.
    property format : String | Nil

    # The identifier for the KMS key that was used to create the encrypted snapshot.
    property kms_key_id : String | Nil

    # The percentage of completion for the import snapshot task.
    property progress : String | Nil

    # The snapshot ID of the disk being imported.
    property snapshot_id : String | Nil

    # A brief status for the import snapshot task.
    property status : String | Nil

    # A detailed status message for the import snapshot task.
    property status_message : String | Nil

    # The URL of the disk image from which the snapshot is created.
    property url : String | Nil

    # The Amazon S3 bucket for the disk image.
    property user_bucket : UserBucketDetails | Nil

    def initialize(
      @description : String | Nil = nil,
      @disk_image_size : Float64 | Nil = nil,
      @encrypted : Bool | Nil = nil,
      @format : String | Nil = nil,
      @kms_key_id : String | Nil = nil,
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

      if value = @disk_image_size
        params << {"#{prefix}DiskImageSize", value.to_s}
      end

      if value = @encrypted
        params << {"#{prefix}Encrypted", Core::QueryValue.bool(value)}
      end

      if value = @format
        params << {"#{prefix}Format", value}
      end

      if value = @kms_key_id
        params << {"#{prefix}KmsKeyId", value}
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
        disk_image_size: Core::XMLValue.f64(node.xpath_node("*[local-name()='diskImageSize']")),
        encrypted: Core::XMLValue.bool(node.xpath_node("*[local-name()='encrypted']")),
        format: Core::XMLValue.string(node.xpath_node("*[local-name()='format']")),
        kms_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='kmsKeyId']")),
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

    def_equals_and_hash(@description, @disk_image_size, @encrypted, @format, @kms_key_id, @progress, @snapshot_id, @status, @status_message, @url, @user_bucket)
  end
end
