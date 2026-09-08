private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AssociationTypeEnum
    Tag
    InstanceId

    def self.to_json(e : AssociationTypeEnum, json : JSON::Builder) : Nil
      value = case e
              when AEC::AssociationTypeEnum::Tag        then "tag"
              when AEC::AssociationTypeEnum::InstanceId then "instance-id"
              else
                raise Exception.new("unknown enum value for 'AssociationTypeEnum' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AssociationTypeEnum
      value = pull.read_string
      case value
      when "tag"         then AEC::AssociationTypeEnum::Tag
      when "instance-id" then AEC::AssociationTypeEnum::InstanceId
      else
        raise Exception.new("unknown enum value for 'AssociationTypeEnum' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AssociationTypeEnum::Tag        then "tag"
      when AEC::AssociationTypeEnum::InstanceId then "instance-id"
      else
        raise Exception.new("unknown enum value for 'AssociationTypeEnum' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AssociationTypeEnum?
      case key
      when "tag"         then AEC::AssociationTypeEnum::Tag
      when "instance-id" then AEC::AssociationTypeEnum::InstanceId
      else
        nil
      end
    end
  end
end
