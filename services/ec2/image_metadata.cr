private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about the AMI.
  class ImageMetadata
    # The ID of the AMI.
    property image_id : String | Nil

    # The name of the AMI.
    property name : String | Nil

    # The ID of the Amazon Web Services account that owns the AMI.
    property owner_id : String | Nil

    # The current state of the AMI. If the state is `available`, the AMI is successfully registered
    # and can be used to launch an instance.
    property state : ImageState | Nil

    # The alias of the AMI owner.
    #
    # Valid values: `amazon` | `aws-backup-vault` | `aws-marketplace`
    property image_owner_alias : String | Nil

    # The date and time the AMI was created.
    property creation_date : String | Nil

    # The deprecation date and time of the AMI, in UTC, in the following format:
    # *YYYY*-*MM*-*DD*T*HH*:*MM*:*SS*Z.
    property deprecation_time : String | Nil

    # If `true`, the AMI satisfies the criteria for Allowed AMIs and can be discovered and used in the
    # account. If `false`, the AMI can't be discovered or used in the account.
    #
    # For more information, see [Control the discovery and use of AMIs in Amazon EC2 with Allowed
    # AMIs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-allowed-amis.html) in *Amazon EC2
    # User Guide*.
    property image_allowed : Bool | Nil

    # Indicates whether the AMI has public launch permissions. A value of `true` means this AMI has
    # public launch permissions, while `false` means it has only implicit (AMI owner) or explicit
    # (shared with your account) launch permissions.
    property is_public : Bool | Nil

    # The watermarks attached to the AMI.
    property image_watermarks : Array(ImageWatermark) | Nil

    def initialize(
      @image_id : String | Nil = nil,
      @name : String | Nil = nil,
      @owner_id : String | Nil = nil,
      @state : ImageState | Nil = nil,
      @image_owner_alias : String | Nil = nil,
      @creation_date : String | Nil = nil,
      @deprecation_time : String | Nil = nil,
      @image_allowed : Bool | Nil = nil,
      @is_public : Bool | Nil = nil,
      @image_watermarks : Array(ImageWatermark) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @image_id
        params << {"#{prefix}ImageId", value}
      end

      if value = @name
        params << {"#{prefix}Name", value}
      end

      if value = @owner_id
        params << {"#{prefix}ImageOwnerId", value}
      end

      if value = @state
        params << {"#{prefix}ImageState", value.to_json_object_key}
      end

      if value = @image_owner_alias
        params << {"#{prefix}ImageOwnerAlias", value}
      end

      if value = @creation_date
        params << {"#{prefix}CreationDate", value}
      end

      if value = @deprecation_time
        params << {"#{prefix}DeprecationTime", value}
      end

      if value = @image_allowed
        params << {"#{prefix}ImageAllowed", Core::QueryValue.bool(value)}
      end

      if value = @is_public
        params << {"#{prefix}IsPublic", Core::QueryValue.bool(value)}
      end

      (@image_watermarks || [] of ImageWatermark).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ImageWatermarkSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='imageId']")),
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='name']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='imageOwnerId']")),
        state: (n = node.xpath_node("*[local-name()='imageState']")) ? AEC::ImageState.from_json_object_key?(n.content) : nil,
        image_owner_alias: Core::XMLValue.string(node.xpath_node("*[local-name()='imageOwnerAlias']")),
        creation_date: Core::XMLValue.string(node.xpath_node("*[local-name()='creationDate']")),
        deprecation_time: Core::XMLValue.string(node.xpath_node("*[local-name()='deprecationTime']")),
        image_allowed: Core::XMLValue.bool(node.xpath_node("*[local-name()='imageAllowed']")),
        is_public: Core::XMLValue.bool(node.xpath_node("*[local-name()='isPublic']")),
        image_watermarks: node.xpath_nodes("*[local-name()='imageWatermarkSet']/*[local-name()='item']").map { |n| ImageWatermark.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @image_watermarks
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@image_id, @name, @owner_id, @state, @image_owner_alias, @creation_date, @deprecation_time, @image_allowed, @is_public, @image_watermarks)
  end
end
