private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an internet gateway.
  class InternetGateway
    # Any VPCs attached to the internet gateway.
    property attachments : Array(InternetGatewayAttachment) | Nil

    # The ID of the internet gateway.
    property internet_gateway_id : String | Nil

    # The ID of the Amazon Web Services account that owns the internet gateway.
    property owner_id : String | Nil

    # Any tags assigned to the internet gateway.
    property tags : Array(Tag) | Nil

    def initialize(
      @attachments : Array(InternetGatewayAttachment) | Nil = nil,
      @internet_gateway_id : String | Nil = nil,
      @owner_id : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@attachments || [] of InternetGatewayAttachment).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AttachmentSet.#{i}."))
      end

      if value = @internet_gateway_id
        params << {"#{prefix}InternetGatewayId", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        attachments: node.xpath_nodes("*[local-name()='attachmentSet']/*[local-name()='item']").map { |n| InternetGatewayAttachment.from_xml(n) },
        internet_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='internetGatewayId']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @attachments
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@attachments, @internet_gateway_id, @owner_id, @tags)
  end
end
