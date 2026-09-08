private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an egress-only internet gateway.
  class EgressOnlyInternetGateway
    # Information about the attachment of the egress-only internet gateway.
    property attachments : Array(InternetGatewayAttachment) | Nil

    # The ID of the egress-only internet gateway.
    property egress_only_internet_gateway_id : String | Nil

    # The tags assigned to the egress-only internet gateway.
    property tags : Array(Tag) | Nil

    def initialize(
      @attachments : Array(InternetGatewayAttachment) | Nil = nil,
      @egress_only_internet_gateway_id : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@attachments || [] of InternetGatewayAttachment).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AttachmentSet.#{i}."))
      end

      if value = @egress_only_internet_gateway_id
        params << {"#{prefix}EgressOnlyInternetGatewayId", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        attachments: node.xpath_nodes("*[local-name()='attachmentSet']/*[local-name()='item']").map { |n| InternetGatewayAttachment.from_xml(n) },
        egress_only_internet_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='egressOnlyInternetGatewayId']")),
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

    def_equals_and_hash(@attachments, @egress_only_internet_gateway_id, @tags)
  end
end
