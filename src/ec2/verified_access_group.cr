private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Verified Access group.
  class VerifiedAccessGroup
    # The ID of the Verified Access group.
    property verified_access_group_id : String | Nil

    # The ID of the Amazon Web Services Verified Access instance.
    property verified_access_instance_id : String | Nil

    # A description for the Amazon Web Services Verified Access group.
    property description : String | Nil

    # The Amazon Web Services account number that owns the group.
    property owner : String | Nil

    # The ARN of the Verified Access group.
    property verified_access_group_arn : String | Nil

    # The creation time.
    property creation_time : String | Nil

    # The last updated time.
    property last_updated_time : String | Nil

    # The deletion time.
    property deletion_time : String | Nil

    # The tags.
    property tags : Array(Tag) | Nil

    # The options in use for server side encryption.
    property sse_specification : VerifiedAccessSseSpecificationResponse | Nil

    def initialize(
      @verified_access_group_id : String | Nil = nil,
      @verified_access_instance_id : String | Nil = nil,
      @description : String | Nil = nil,
      @owner : String | Nil = nil,
      @verified_access_group_arn : String | Nil = nil,
      @creation_time : String | Nil = nil,
      @last_updated_time : String | Nil = nil,
      @deletion_time : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @sse_specification : VerifiedAccessSseSpecificationResponse | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @verified_access_group_id
        params << {"#{prefix}VerifiedAccessGroupId", value}
      end

      if value = @verified_access_instance_id
        params << {"#{prefix}VerifiedAccessInstanceId", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @owner
        params << {"#{prefix}Owner", value}
      end

      if value = @verified_access_group_arn
        params << {"#{prefix}VerifiedAccessGroupArn", value}
      end

      if value = @creation_time
        params << {"#{prefix}CreationTime", value}
      end

      if value = @last_updated_time
        params << {"#{prefix}LastUpdatedTime", value}
      end

      if value = @deletion_time
        params << {"#{prefix}DeletionTime", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @sse_specification
        params.concat(value.to_query_params("#{prefix}SseSpecification."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        verified_access_group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='verifiedAccessGroupId']")),
        verified_access_instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='verifiedAccessInstanceId']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        owner: Core::XMLValue.string(node.xpath_node("*[local-name()='owner']")),
        verified_access_group_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='verifiedAccessGroupArn']")),
        creation_time: Core::XMLValue.string(node.xpath_node("*[local-name()='creationTime']")),
        last_updated_time: Core::XMLValue.string(node.xpath_node("*[local-name()='lastUpdatedTime']")),
        deletion_time: Core::XMLValue.string(node.xpath_node("*[local-name()='deletionTime']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        sse_specification: node.xpath_node("*[local-name()='sseSpecification']").try { |n| VerifiedAccessSseSpecificationResponse.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end

      if value = @sse_specification
        value.validate!
      end
    end

    def_equals_and_hash(@verified_access_group_id, @verified_access_instance_id, @description, @owner, @verified_access_group_arn, @creation_time, @last_updated_time, @deletion_time, @tags, @sse_specification)
  end
end
