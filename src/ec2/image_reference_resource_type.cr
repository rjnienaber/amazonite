private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ImageReferenceResourceType
    Ec2Instance
    Ec2LaunchTemplate
    SsmParameter
    ImagebuilderImageRecipe
    ImagebuilderContainerRecipe

    def self.to_json(e : ImageReferenceResourceType, json : JSON::Builder) : Nil
      value = case e
              when AEC::ImageReferenceResourceType::Ec2Instance                 then "ec2:Instance"
              when AEC::ImageReferenceResourceType::Ec2LaunchTemplate           then "ec2:LaunchTemplate"
              when AEC::ImageReferenceResourceType::SsmParameter                then "ssm:Parameter"
              when AEC::ImageReferenceResourceType::ImagebuilderImageRecipe     then "imagebuilder:ImageRecipe"
              when AEC::ImageReferenceResourceType::ImagebuilderContainerRecipe then "imagebuilder:ContainerRecipe"
              else
                raise Exception.new("unknown enum value for 'ImageReferenceResourceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ImageReferenceResourceType
      value = pull.read_string
      case value
      when "ec2:Instance"                 then AEC::ImageReferenceResourceType::Ec2Instance
      when "ec2:LaunchTemplate"           then AEC::ImageReferenceResourceType::Ec2LaunchTemplate
      when "ssm:Parameter"                then AEC::ImageReferenceResourceType::SsmParameter
      when "imagebuilder:ImageRecipe"     then AEC::ImageReferenceResourceType::ImagebuilderImageRecipe
      when "imagebuilder:ContainerRecipe" then AEC::ImageReferenceResourceType::ImagebuilderContainerRecipe
      else
        raise Exception.new("unknown enum value for 'ImageReferenceResourceType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ImageReferenceResourceType::Ec2Instance                 then "ec2:Instance"
      when AEC::ImageReferenceResourceType::Ec2LaunchTemplate           then "ec2:LaunchTemplate"
      when AEC::ImageReferenceResourceType::SsmParameter                then "ssm:Parameter"
      when AEC::ImageReferenceResourceType::ImagebuilderImageRecipe     then "imagebuilder:ImageRecipe"
      when AEC::ImageReferenceResourceType::ImagebuilderContainerRecipe then "imagebuilder:ContainerRecipe"
      else
        raise Exception.new("unknown enum value for 'ImageReferenceResourceType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ImageReferenceResourceType?
      case key
      when "ec2:Instance"                 then AEC::ImageReferenceResourceType::Ec2Instance
      when "ec2:LaunchTemplate"           then AEC::ImageReferenceResourceType::Ec2LaunchTemplate
      when "ssm:Parameter"                then AEC::ImageReferenceResourceType::SsmParameter
      when "imagebuilder:ImageRecipe"     then AEC::ImageReferenceResourceType::ImagebuilderImageRecipe
      when "imagebuilder:ContainerRecipe" then AEC::ImageReferenceResourceType::ImagebuilderContainerRecipe
      else
        nil
      end
    end
  end
end
