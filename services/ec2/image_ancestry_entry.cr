private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about a single AMI in the ancestry chain and its source (parent) AMI.
  class ImageAncestryEntry
    # The date and time when this AMI was created.
    property creation_date : Time | Nil

    # The ID of this AMI.
    property image_id : String | Nil

    # The owner alias (`amazon` | `aws-backup-vault` | `aws-marketplace` ) of this AMI, if one is
    # assigned. Otherwise, the value is `null`.
    property image_owner_alias : String | Nil

    # The ID of the parent AMI.
    property source_image_id : String | Nil

    # The Amazon Web Services Region of the parent AMI.
    property source_image_region : String | Nil

    def initialize(
      @creation_date : Time | Nil = nil,
      @image_id : String | Nil = nil,
      @image_owner_alias : String | Nil = nil,
      @source_image_id : String | Nil = nil,
      @source_image_region : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @creation_date
        params << {"#{prefix}CreationDate", Core::QueryValue.time(value)}
      end

      if value = @image_id
        params << {"#{prefix}ImageId", value}
      end

      if value = @image_owner_alias
        params << {"#{prefix}ImageOwnerAlias", value}
      end

      if value = @source_image_id
        params << {"#{prefix}SourceImageId", value}
      end

      if value = @source_image_region
        params << {"#{prefix}SourceImageRegion", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        creation_date: Core::XMLValue.time(node.xpath_node("*[local-name()='creationDate']")),
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='imageId']")),
        image_owner_alias: Core::XMLValue.string(node.xpath_node("*[local-name()='imageOwnerAlias']")),
        source_image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='sourceImageId']")),
        source_image_region: Core::XMLValue.string(node.xpath_node("*[local-name()='sourceImageRegion']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@creation_date, @image_id, @image_owner_alias, @source_image_id, @source_image_region)
  end
end
