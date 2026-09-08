private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the permissions for a security group rule.
  class IpPermission
    # The IP protocol name (`tcp`, `udp`, `icmp`, `icmpv6`) or number (see [Protocol
    # Numbers](http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml)).
    #
    # Use `-1` to specify all protocols. When authorizing security group rules, specifying `-1` or a
    # protocol number other than `tcp`, `udp`, `icmp`, or `icmpv6` allows traffic on all ports,
    # regardless of any port range you specify. For `tcp`, `udp`, and `icmp`, you must specify a port
    # range. For `icmpv6`, the port range is optional; if you omit the port range, traffic for all
    # types and codes is allowed.
    property ip_protocol : String | Nil

    # If the protocol is TCP or UDP, this is the start of the port range. If the protocol is ICMP or
    # ICMPv6, this is the ICMP type or -1 (all ICMP types).
    property from_port : Int32 | Nil

    # If the protocol is TCP or UDP, this is the end of the port range. If the protocol is ICMP or
    # ICMPv6, this is the ICMP code or -1 (all ICMP codes). If the start port is -1 (all ICMP types),
    # then the end port must be -1 (all ICMP codes).
    property to_port : Int32 | Nil

    # The security group and Amazon Web Services account ID pairs.
    property user_id_group_pairs : Array(UserIdGroupPair) | Nil

    # The IPv4 address ranges.
    property ip_ranges : Array(IpRange) | Nil

    # The IPv6 address ranges.
    property ipv_6_ranges : Array(Ipv6Range) | Nil

    # The prefix list IDs.
    property prefix_list_ids : Array(PrefixListId) | Nil

    def initialize(
      @ip_protocol : String | Nil = nil,
      @from_port : Int32 | Nil = nil,
      @to_port : Int32 | Nil = nil,
      @user_id_group_pairs : Array(UserIdGroupPair) | Nil = nil,
      @ip_ranges : Array(IpRange) | Nil = nil,
      @ipv_6_ranges : Array(Ipv6Range) | Nil = nil,
      @prefix_list_ids : Array(PrefixListId) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ip_protocol
        params << {"#{prefix}IpProtocol", value}
      end

      if value = @from_port
        params << {"#{prefix}FromPort", value.to_s}
      end

      if value = @to_port
        params << {"#{prefix}ToPort", value.to_s}
      end

      (@user_id_group_pairs || [] of UserIdGroupPair).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Groups.#{i}."))
      end

      (@ip_ranges || [] of IpRange).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}IpRanges.#{i}."))
      end

      (@ipv_6_ranges || [] of Ipv6Range).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Ipv6Ranges.#{i}."))
      end

      (@prefix_list_ids || [] of PrefixListId).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PrefixListIds.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ip_protocol: Core::XMLValue.string(node.xpath_node("*[local-name()='ipProtocol']")),
        from_port: Core::XMLValue.i32(node.xpath_node("*[local-name()='fromPort']")),
        to_port: Core::XMLValue.i32(node.xpath_node("*[local-name()='toPort']")),
        user_id_group_pairs: node.xpath_nodes("*[local-name()='groups']/*[local-name()='item']").map { |n| UserIdGroupPair.from_xml(n) },
        ip_ranges: node.xpath_nodes("*[local-name()='ipRanges']/*[local-name()='item']").map { |n| IpRange.from_xml(n) },
        ipv_6_ranges: node.xpath_nodes("*[local-name()='ipv6Ranges']/*[local-name()='item']").map { |n| Ipv6Range.from_xml(n) },
        prefix_list_ids: node.xpath_nodes("*[local-name()='prefixListIds']/*[local-name()='item']").map { |n| PrefixListId.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @user_id_group_pairs
        value.each(&.validate!)
      end

      if value = @ip_ranges
        value.each(&.validate!)
      end

      if value = @ipv_6_ranges
        value.each(&.validate!)
      end

      if value = @prefix_list_ids
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@ip_protocol, @from_port, @to_port, @user_id_group_pairs, @ip_ranges, @ipv_6_ranges, @prefix_list_ids)
  end
end
