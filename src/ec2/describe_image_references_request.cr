private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeImageReferencesRequest
    # The IDs of the images to check for resource references.
    property image_ids : Array(String) = [] of String

    # Specifies whether to check all supported Amazon Web Services resource types for image
    # references. When specified, default values are applied for `ResourceTypeOptions`. For the
    # default values, see [How AMI reference checks
    # work](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-ami-references.html#how-ami-references-works)
    # in the *Amazon EC2 User Guide*. If you also specify `ResourceTypes` with `ResourceTypeOptions`,
    # your specified values override the default values.
    #
    # Supported resource types: `ec2:Instance` | `ec2:LaunchTemplate` | `ssm:Parameter` |
    # `imagebuilder:ImageRecipe` | `imagebuilder:ContainerRecipe`
    #
    # Either `IncludeAllResourceTypes` or `ResourceTypes` must be specified.
    property include_all_resource_types : Bool | Nil

    # The Amazon Web Services resource types to check for image references.
    #
    # Either `IncludeAllResourceTypes` or `ResourceTypes` must be specified.
    property resource_types : Array(ResourceTypeRequest) | Nil

    # The token returned from a previous paginated request. Pagination continues from the end of the
    # items returned by the previous request.
    property next_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    def initialize(
      @image_ids : Array(String),
      @include_all_resource_types : Bool | Nil = nil,
      @resource_types : Array(ResourceTypeRequest) | Nil = nil,
      @next_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @image_ids.each_with_index(1) do |item, i|
        params << {"#{prefix}ImageId.#{i}", item}
      end

      if value = @include_all_resource_types
        params << {"#{prefix}IncludeAllResourceTypes", Core::QueryValue.bool(value)}
      end

      (@resource_types || [] of ResourceTypeRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ResourceType.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_ids: node.xpath_nodes("*[local-name()='ImageId']/*[local-name()='item']").map { |n| n.content },
        include_all_resource_types: Core::XMLValue.bool(node.xpath_node("*[local-name()='IncludeAllResourceTypes']")),
        resource_types: node.xpath_nodes("*[local-name()='ResourceType']/*[local-name()='item']").map { |n| ResourceTypeRequest.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
      )
    end

    def validate! : Nil
      if value = @image_ids
        raise Core::ValidationError.new("ImageIds must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("ImageIds must have at most 10 item(s)") if value.size > 10
      end

      if value = @resource_types
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 5") if value < 5
      end
    end

    def_equals_and_hash(@image_ids, @include_all_resource_types, @resource_types, @next_token, @dry_run, @max_results)
  end
end
