private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeImagesRequest
    # Scopes the images by users with explicit launch permissions. Specify an Amazon Web Services
    # account ID, `self` (the sender of the request), or `all` (public AMIs).
    #
    # - If you specify an Amazon Web Services account ID that is not your own, only AMIs shared with
    # that specific Amazon Web Services account ID are returned. However, AMIs that are shared with
    # the account’s organization or organizational unit (OU) are not returned.
    #
    # - If you specify `self` or your own Amazon Web Services account ID, AMIs shared with your
    # account are returned. In addition, AMIs that are shared with the organization or OU of which you
    # are member are also returned.
    #
    # - If you specify `all`, all public AMIs are returned.
    property executable_users : Array(String) | Nil

    # The image IDs.
    #
    # Default: Describes all images available to you.
    property image_ids : Array(String) | Nil

    # Scopes the results to images with the specified owners. You can specify a combination of Amazon
    # Web Services account IDs, `self`, `amazon`, `aws-backup-vault`, and `aws-marketplace`. If you
    # omit this parameter, the results include all images for which you have launch permissions,
    # regardless of ownership.
    property owners : Array(String) | Nil

    # Specifies whether to include deprecated AMIs.
    #
    # Default: No deprecated AMIs are included in the response.
    #
    # If you are the AMI owner, all deprecated AMIs appear in the response regardless of what you
    # specify for this parameter.
    property include_deprecated : Bool | Nil

    # Specifies whether to include disabled AMIs.
    #
    # Default: No disabled AMIs are included in the response.
    property include_disabled : Bool | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    # The token returned from a previous paginated request. Pagination continues from the end of the
    # items returned by the previous request.
    property next_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The filters.
    #
    # - `architecture` - The image architecture (`i386` | `x86_64` | `arm64` | `x86_64_mac` |
    # `arm64_mac`).
    #
    # - `block-device-mapping.delete-on-termination` - A Boolean value that indicates whether the
    # Amazon EBS volume is deleted on instance termination.
    #
    # - `block-device-mapping.device-name` - The device name specified in the block device mapping
    # (for example, `/dev/sdh` or `xvdh`).
    #
    # - `block-device-mapping.snapshot-id` - The ID of the snapshot used for the Amazon EBS volume.
    #
    # - `block-device-mapping.volume-size` - The volume size of the Amazon EBS volume, in GiB.
    #
    # - `block-device-mapping.volume-type` - The volume type of the Amazon EBS volume (`io1` | `io2` |
    # `gp2` | `gp3` | `sc1 `| `st1` | `standard`).
    #
    # - `block-device-mapping.encrypted` - A Boolean that indicates whether the Amazon EBS volume is
    # encrypted.
    #
    # - `boot-mode` – The boot mode of the image (`legacy-bios` | `uefi` | `uefi-preferred`).
    #
    # - `creation-date` - The time when the image was created, in the ISO 8601 format in the UTC time
    # zone (YYYY-MM-DDThh:mm:ss.sssZ), for example, `2021-09-29T11:04:43.305Z`. You can use a wildcard
    # (`*`), for example, `2021-09-29T*`, which matches an entire day.
    #
    # - `description` - The description of the image (provided during image creation).
    #
    # - `ena-support` - A Boolean that indicates whether enhanced networking with ENA is enabled.
    #
    # - `free-tier-eligible` - A Boolean that indicates whether this image can be used under the
    # Amazon Web Services Free Tier (`true` | `false`).
    #
    # - `hypervisor` - The hypervisor type (`ovm` | `xen`).
    #
    # - `image-allowed` - A Boolean that indicates whether the image meets the criteria specified for
    # Allowed AMIs.
    #
    # - `image-id` - The ID of the image.
    #
    # - `image-watermark.source-image-creation-time` - The creation date of the source AMI, in the ISO
    # 8601 format in the UTC time zone (` *YYYY*-*MM*-*DD*T*HH*:*MM*:*SS*.*ssssss*+*HH*:*MM* `). You
    # can use a wildcard (`*`), for example, `2021-09-29T*`, which matches an entire day.
    #
    # - `image-watermark.source-image-id` - The ID of the AMI to which the watermark was originally
    # attached.
    #
    # - `image-watermark.source-image-region` - The Region where the watermark was originally
    # attached.
    #
    # - `image-watermark.watermark-creation-time` - The date and time the watermark was attached to
    # the AMI, in the ISO 8601 format in the UTC time zone (`
    # *YYYY*-*MM*-*DD*T*HH*:*MM*:*SS*.*ssssss*+*HH*:*MM* `). You can use a wildcard (`*`), for
    # example, `2021-09-29T*`, which matches an entire day.
    #
    # - `image-watermark.watermark-key` - The watermark identifier, in `accountId:watermarkName`
    # format (for example, `123456789012:approvedAmi`).
    #
    # - `image-type` - The image type (`machine` | `kernel` | `ramdisk`).
    #
    # - `instance-type-specification.supported-instance-type` – The instance types that are compatible
    # with the AMI, as specified by the AMI owner. Values can be individual instance types (for
    # example, `t3.micro`) or wildcard patterns that match multiple instance types (for example,
    # `t3.*`).
    #
    # - `instance-type-specification.unsupported-instance-type` – The instance types that are not
    # compatible with the AMI, as specified by the AMI owner. Values can be individual instance types
    # (for example, `t3.micro`) or wildcard patterns that match multiple instance types (for example,
    # `t3.*`).
    #
    # - `is-public` - A Boolean that indicates whether the image is public.
    #
    # - `kernel-id` - The kernel ID.
    #
    # - `manifest-location` - The location of the image manifest.
    #
    # - `name` - The name of the AMI (provided during image creation).
    #
    # - `owner-alias` - The owner alias (`amazon` | `aws-backup-vault` | `aws-marketplace`). The valid
    # aliases are defined in an Amazon-maintained list. This is not the Amazon Web Services account
    # alias that can be set using the IAM console. We recommend that you use the **Owner** request
    # parameter instead of this filter.
    #
    # - `owner-id` - The Amazon Web Services account ID of the owner. We recommend that you use the
    # **Owner** request parameter instead of this filter.
    #
    # - `platform` - The platform. The only supported value is `windows`.
    #
    # - `product-code` - The product code.
    #
    # - `product-code.type` - The type of the product code (`marketplace`).
    #
    # - `public-ssm-parameter-name` - The name of a public Systems Manager parameter associated with
    # the AMI. The parameter must be in a trusted Amazon Web Services namespace under `aws/service/`.
    # Returns all AMIs that have ever been associated with the parameter, including previous versions.
    #
    # - `ramdisk-id` - The RAM disk ID.
    #
    # - `root-device-name` - The device name of the root device volume (for example, `/dev/sda1`).
    #
    # - `root-device-type` - The type of the root device volume (`ebs` | `instance-store`).
    #
    # - `source-image-id` - The ID of the source AMI from which the AMI was created.
    #
    # - `source-image-region` - The Region of the source AMI.
    #
    # - `source-instance-id` - The ID of the instance that the AMI was created from if the AMI was
    # created using CreateImage. This filter is applicable only if the AMI was created using
    # [CreateImage](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateImage.html).
    #
    # - `state` - The state of the image (`available` | `pending` | `failed`).
    #
    # - `state-reason-code` - The reason code for the state change.
    #
    # - `state-reason-message` - The message for the state change.
    #
    # - `sriov-net-support` - A value of `simple` indicates that enhanced networking with the Intel
    # 82599 VF interface is enabled.
    #
    # - `tag:` - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # assigned a tag with a specific key, regardless of the tag value.
    #
    # - `virtualization-type` - The virtualization type (`paravirtual` | `hvm`).
    property filters : Array(Filter) | Nil

    def initialize(
      @executable_users : Array(String) | Nil = nil,
      @image_ids : Array(String) | Nil = nil,
      @owners : Array(String) | Nil = nil,
      @include_deprecated : Bool | Nil = nil,
      @include_disabled : Bool | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@executable_users || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ExecutableBy.#{i}", item}
      end

      (@image_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ImageId.#{i}", item}
      end

      (@owners || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Owner.#{i}", item}
      end

      if value = @include_deprecated
        params << {"#{prefix}IncludeDeprecated", Core::QueryValue.bool(value)}
      end

      if value = @include_disabled
        params << {"#{prefix}IncludeDisabled", Core::QueryValue.bool(value)}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        executable_users: node.xpath_nodes("*[local-name()='ExecutableBy']/*[local-name()='ExecutableBy']").map { |n| n.content },
        image_ids: node.xpath_nodes("*[local-name()='ImageId']/*[local-name()='ImageId']").map { |n| n.content },
        owners: node.xpath_nodes("*[local-name()='Owner']/*[local-name()='Owner']").map { |n| n.content },
        include_deprecated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IncludeDeprecated']")),
        include_disabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='IncludeDisabled']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@executable_users, @image_ids, @owners, @include_deprecated, @include_disabled, @max_results, @next_token, @dry_run, @filters)
  end
end
