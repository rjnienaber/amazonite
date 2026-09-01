private alias AI = Amazonite::Iam
private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains details about the specified entity (user or role).
  #
  # This data type is an element of the
  # [EntityDetails](https://docs.aws.amazon.com/IAM/latest/APIReference/API_EntityDetails.html)
  # object.
  class EntityInfo
    property arn : String

    # The name of the entity (user or role).
    property name : String

    # The type of entity (user or role).
    property type : PolicyOwnerEntityType

    # The identifier of the entity (user or role).
    property id : String

    # The path to the entity (user or role). For more information about paths, see [IAM
    # identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html) in the
    # *IAM User Guide*.
    property path : String | Nil

    def initialize(
      @arn : String,
      @name : String,
      @type : PolicyOwnerEntityType,
      @id : String,
      @path : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Arn", @arn}

      params << {"#{prefix}Name", @name}

      params << {"#{prefix}Type", @type.to_json_object_key}

      params << {"#{prefix}Id", @id}

      if value = @path
        params << {"#{prefix}Path", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")).not_nil!,
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='Name']")).not_nil!,
        type: ((n = node.xpath_node("*[local-name()='Type']")) ? AI::PolicyOwnerEntityType.from_json_object_key?(n.content) : nil).not_nil!,
        id: Core::XMLValue.string(node.xpath_node("*[local-name()='Id']")).not_nil!,
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")),
      )
    end

    def validate! : Nil
      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("Arn length must be <= 2048") if value.size > 2048
      end

      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @id
        raise Core::ValidationError.new("Id length must be >= 16") if value.size < 16
        raise Core::ValidationError.new("Id length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("Id does not match the required pattern") unless value.matches?(Regex.new("^[\\w]+$"))
      end

      if value = @path
        raise Core::ValidationError.new("Path length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Path length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("Path does not match the required pattern") unless value.matches?(Regex.new("^(/)|(/[!-~]+/)$"))
      end
    end

    def_equals_and_hash(@arn, @name, @type, @id, @path)
  end
end
