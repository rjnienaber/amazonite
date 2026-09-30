private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum PermissionGroup
    All

    def self.to_json(e : PermissionGroup, json : JSON::Builder) : Nil
      value = case e
              when AEC::PermissionGroup::All then "all"
              else
                raise Exception.new("unknown enum value for 'PermissionGroup' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::PermissionGroup
      value = pull.read_string
      case value
      when "all" then AEC::PermissionGroup::All
      else
        raise Exception.new("unknown enum value for 'PermissionGroup' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::PermissionGroup::All then "all"
      else
        raise Exception.new("unknown enum value for 'PermissionGroup' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::PermissionGroup?
      case key
      when "all" then AEC::PermissionGroup::All
      else
        nil
      end
    end
  end
end
