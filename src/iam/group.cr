private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains information about an IAM group entity.
  #
  # This data type is used as a response element in the following operations:
  #
  # - [CreateGroup](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateGroup.html)
  #
  # - [GetGroup](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetGroup.html)
  #
  # - [ListGroups](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListGroups.html)
  class Group
    # The path to the group. For more information about paths, see [IAM
    # identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html) in the
    # *IAM User Guide*.
    property path : String

    # The friendly name that identifies the group.
    property group_name : String

    # The stable and unique string identifying the group. For more information about IDs, see [IAM
    # identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html) in the
    # *IAM User Guide*.
    property group_id : String

    # The Amazon Resource Name (ARN) specifying the group. For more information about ARNs and how to
    # use them in policies, see [IAM
    # identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html) in the
    # *IAM User Guide*.
    property arn : String

    # The date and time, in [ISO 8601 date-time format](http://www.iso.org/iso/iso8601), when the
    # group was created.
    property create_date : Time

    def initialize(
      @path : String,
      @group_name : String,
      @group_id : String,
      @arn : String,
      @create_date : Time,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Path", @path}

      params << {"#{prefix}GroupName", @group_name}

      params << {"#{prefix}GroupId", @group_id}

      params << {"#{prefix}Arn", @arn}

      params << {"#{prefix}CreateDate", Core::QueryValue.time(@create_date)}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")).not_nil!,
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupName']")).not_nil!,
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupId']")).not_nil!,
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")).not_nil!,
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @path
        raise Core::ValidationError.new("Path length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Path length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("Path does not match the required pattern") unless value.matches?(Regex.new("^(/)|(/[!-~]+/)$"))
      end

      if value = @group_name
        raise Core::ValidationError.new("GroupName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("GroupName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("GroupName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @group_id
        raise Core::ValidationError.new("GroupId length must be >= 16") if value.size < 16
        raise Core::ValidationError.new("GroupId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("GroupId does not match the required pattern") unless value.matches?(Regex.new("^[\\w]+$"))
      end

      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("Arn length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@path, @group_name, @group_id, @arn, @create_date)
  end
end
