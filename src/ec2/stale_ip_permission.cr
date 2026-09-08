private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a stale rule in a security group.
  class StaleIpPermission
    # If the protocol is TCP or UDP, this is the start of the port range. If the protocol is ICMP or
    # ICMPv6, this is the ICMP type or -1 (all ICMP types).
    property from_port : Int32 | Nil

    # The IP protocol name (`tcp`, `udp`, `icmp`, `icmpv6`) or number (see [Protocol
    # Numbers)](http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml).
    property ip_protocol : String | Nil

    # The IP ranges. Not applicable for stale security group rules.
    property ip_ranges : Array(String) | Nil

    # The prefix list IDs. Not applicable for stale security group rules.
    property prefix_list_ids : Array(String) | Nil

    # If the protocol is TCP or UDP, this is the end of the port range. If the protocol is ICMP or
    # ICMPv6, this is the ICMP code or -1 (all ICMP codes).
    property to_port : Int32 | Nil

    # The security group pairs. Returns the ID of the referenced security group and VPC, and the ID
    # and status of the VPC peering connection.
    property user_id_group_pairs : Array(UserIdGroupPair) | Nil

    def initialize(
      @from_port : Int32 | Nil = nil,
      @ip_protocol : String | Nil = nil,
      @ip_ranges : Array(String) | Nil = nil,
      @prefix_list_ids : Array(String) | Nil = nil,
      @to_port : Int32 | Nil = nil,
      @user_id_group_pairs : Array(UserIdGroupPair) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @from_port
        params << {"#{prefix}FromPort", value.to_s}
      end

      if value = @ip_protocol
        params << {"#{prefix}IpProtocol", value}
      end

      (@ip_ranges || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}IpRanges.#{i}", item}
      end

      (@prefix_list_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}PrefixListIds.#{i}", item}
      end

      if value = @to_port
        params << {"#{prefix}ToPort", value.to_s}
      end

      (@user_id_group_pairs || [] of UserIdGroupPair).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Groups.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        from_port: Core::XMLValue.i32(node.xpath_node("*[local-name()='fromPort']")),
        ip_protocol: Core::XMLValue.string(node.xpath_node("*[local-name()='ipProtocol']")),
        ip_ranges: node.xpath_nodes("*[local-name()='ipRanges']/*[local-name()='item']").map { |n| n.content },
        prefix_list_ids: node.xpath_nodes("*[local-name()='prefixListIds']/*[local-name()='item']").map { |n| n.content },
        to_port: Core::XMLValue.i32(node.xpath_node("*[local-name()='toPort']")),
        user_id_group_pairs: node.xpath_nodes("*[local-name()='groups']/*[local-name()='item']").map { |n| UserIdGroupPair.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @user_id_group_pairs
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@from_port, @ip_protocol, @ip_ranges, @prefix_list_ids, @to_port, @user_id_group_pairs)
  end
end
