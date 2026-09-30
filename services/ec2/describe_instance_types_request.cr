private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeInstanceTypesRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The instance types.
    property instance_types : Array(InstanceType) | Nil

    # One or more filters. Filter names and values are case-sensitive.
    #
    # - `auto-recovery-supported` - Indicates whether Amazon CloudWatch action based recovery is
    # supported (`true` | `false`).
    #
    # - `bare-metal` - Indicates whether it is a bare metal instance type (`true` | `false`).
    #
    # - `burstable-performance-supported` - Indicates whether the instance type is a burstable
    # performance T instance type (`true` | `false`).
    #
    # - `current-generation` - Indicates whether this instance type is the latest generation instance
    # type of an instance family (`true` | `false`).
    #
    # - `dedicated-hosts-supported` - Indicates whether the instance type supports Dedicated Hosts.
    # (`true` | `false`)
    #
    # - `ebs-info.attachment-limit-type` - The type of Amazon EBS volume attachment limit (`shared` |
    # `dedicated`).
    #
    # - `ebs-info.maximum-ebs-attachments` - The maximum number of Amazon EBS volumes that can be
    # attached to the instance type.
    #
    # - `ebs-info.ebs-optimized-info.baseline-bandwidth-in-mbps` - The baseline bandwidth performance
    # for an EBS-optimized instance type, in Mbps.
    #
    # - `ebs-info.ebs-optimized-info.baseline-iops` - The baseline input/output storage operations per
    # second for an EBS-optimized instance type.
    #
    # - `ebs-info.ebs-optimized-info.baseline-throughput-in-mbps` - The baseline throughput
    # performance for an EBS-optimized instance type, in MB/s.
    #
    # - `ebs-info.ebs-optimized-info.maximum-bandwidth-in-mbps` - The maximum bandwidth performance
    # for an EBS-optimized instance type, in Mbps.
    #
    # - `ebs-info.ebs-optimized-info.maximum-iops` - The maximum input/output storage operations per
    # second for an EBS-optimized instance type.
    #
    # - `ebs-info.ebs-optimized-info.maximum-throughput-in-mbps` - The maximum throughput performance
    # for an EBS-optimized instance type, in MB/s.
    #
    # - `ebs-info.ebs-optimized-support` - Indicates whether the instance type is EBS-optimized
    # (`supported` | `unsupported` | `default`).
    #
    # - `ebs-info.encryption-support` - Indicates whether EBS encryption is supported (`supported` |
    # `unsupported`).
    #
    # - `ebs-info.nvme-support` - Indicates whether non-volatile memory express (NVMe) is supported
    # for EBS volumes (`required` | `supported` | `unsupported`).
    #
    # - `free-tier-eligible` - A Boolean that indicates whether this instance type can be used under
    # the Amazon Web Services Free Tier (`true` | `false`).
    #
    # - `hibernation-supported` - Indicates whether On-Demand hibernation is supported (`true` |
    # `false`).
    #
    # - `hypervisor` - The hypervisor (`nitro` | `xen`).
    #
    # - `instance-storage-info.disk.count` - The number of local disks.
    #
    # - `instance-storage-info.disk.size-in-gb` - The storage size of each instance storage disk, in
    # GB.
    #
    # - `instance-storage-info.disk.type` - The storage technology for the local instance storage
    # disks (`hdd` | `ssd`).
    #
    # - `instance-storage-info.encryption-support` - Indicates whether data is encrypted at rest
    # (`required` | `supported` | `unsupported`).
    #
    # - `instance-storage-info.nvme-support` - Indicates whether non-volatile memory express (NVMe) is
    # supported for instance store (`required` | `supported` | `unsupported`).
    #
    # - `instance-storage-info.total-size-in-gb` - The total amount of storage available from all
    # local instance storage, in GB.
    #
    # - `instance-storage-supported` - Indicates whether the instance type has local instance storage
    # (`true` | `false`).
    #
    # - `instance-type` - The instance type (for example `c5.2xlarge` or c5*).
    #
    # - `memory-info.size-in-mib` - The memory size.
    #
    # - `network-info.bandwidth-weightings` - For instances that support bandwidth weighting to boost
    # performance (`default`, `vpc-1`, `ebs-1`).
    #
    # - `network-info.efa-info.maximum-efa-interfaces` - The maximum number of Elastic Fabric Adapters
    # (EFAs) per instance.
    #
    # - `network-info.efa-supported` - Indicates whether the instance type supports Elastic Fabric
    # Adapter (EFA) (`true` | `false`).
    #
    # - `network-info.ena-support` - Indicates whether Elastic Network Adapter (ENA) is supported or
    # required (`required` | `supported` | `unsupported`).
    #
    # - `network-info.flexible-ena-queues-support` - Indicates whether an instance supports flexible
    # ENA queues (`supported` | `unsupported`).
    #
    # - `network-info.encryption-in-transit-supported` - Indicates whether the instance type
    # automatically encrypts in-transit traffic between instances (`true` | `false`).
    #
    # - `network-info.ipv4-addresses-per-interface` - The maximum number of private IPv4 addresses per
    # network interface.
    #
    # - `network-info.ipv6-addresses-per-interface` - The maximum number of private IPv6 addresses per
    # network interface.
    #
    # - `network-info.ipv6-supported` - Indicates whether the instance type supports IPv6 (`true` |
    # `false`).
    #
    # - `network-info.maximum-network-cards` - The maximum number of network cards per instance.
    #
    # - `network-info.maximum-network-interfaces` - The maximum number of network interfaces per
    # instance.
    #
    # - `network-info.network-performance` - The network performance (for example, "25 Gigabit").
    #
    # - `nitro-enclaves-support` - Indicates whether Nitro Enclaves is supported (`supported` |
    # `unsupported`).
    #
    # - `nitro-tpm-support` - Indicates whether NitroTPM is supported (`supported` | `unsupported`).
    #
    # - `nitro-tpm-info.supported-versions` - The supported NitroTPM version (`2.0`).
    #
    # - `processor-info.supported-architecture` - The CPU architecture (`arm64` | `i386` | `x86_64`).
    #
    # - `processor-info.sustained-clock-speed-in-ghz` - The CPU clock speed, in GHz.
    #
    # - `processor-info.supported-features` - The supported CPU features (`amd-sev-snp`).
    #
    # - `reboot-migration-support` - Indicates whether enabling reboot migration is supported
    # (`supported` | `unsupported`).
    #
    # - `supported-boot-mode` - The boot mode (`legacy-bios` | `uefi`).
    #
    # - `supported-root-device-type` - The root device type (`ebs` | `instance-store`).
    #
    # - `supported-usage-class` - The usage class (`on-demand` | `spot` | `capacity-block`).
    #
    # - `supported-virtualization-type` - The virtualization type (`hvm` | `paravirtual`).
    #
    # - `vcpu-info.default-cores` - The default number of cores for the instance type.
    #
    # - `vcpu-info.default-threads-per-core` - The default number of threads per core for the instance
    # type.
    #
    # - `vcpu-info.default-vcpus` - The default number of vCPUs for the instance type.
    #
    # - `vcpu-info.valid-cores` - The number of cores that can be configured for the instance type.
    #
    # - `vcpu-info.valid-threads-per-core` - The number of threads per core that can be configured for
    # the instance type. For example, "1" or "1,2".
    property filters : Array(Filter) | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    # The token returned from a previous paginated request. Pagination continues from the end of the
    # items returned by the previous request.
    property next_token : String | Nil

    # If `true`, the response includes instance types that are not supported in the current Region, in
    # addition to the supported types. Default: `false`.
    property include_unsupported_in_region : Bool | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @instance_types : Array(InstanceType) | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @include_unsupported_in_region : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@instance_types || [] of InstanceType).each_with_index(1) do |item, i|
        params << {"#{prefix}InstanceType.#{i}", item.to_json_object_key}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @include_unsupported_in_region
        params << {"#{prefix}IncludeUnsupportedInRegion", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        instance_types: node.xpath_nodes("*[local-name()='InstanceType']/*[local-name()='item']").compact_map { |n| AEC::InstanceType.from_json_object_key?(n.content) },
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        include_unsupported_in_region: Core::XMLValue.bool(node.xpath_node("*[local-name()='IncludeUnsupportedInRegion']")),
      )
    end

    def validate! : Nil
      if value = @instance_types
        raise Core::ValidationError.new("InstanceTypes must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("InstanceTypes must have at most 100 item(s)") if value.size > 100
      end

      if value = @filters
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 5") if value < 5
        raise Core::ValidationError.new("MaxResults value must be <= 100") if value > 100
      end
    end

    def_equals_and_hash(@dry_run, @instance_types, @filters, @max_results, @next_token, @include_unsupported_in_region)
  end
end
