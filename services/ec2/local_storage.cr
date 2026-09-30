private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum LocalStorage
    Included
    Required
    Excluded

    def self.to_json(e : LocalStorage, json : JSON::Builder) : Nil
      value = case e
              when AEC::LocalStorage::Included then "included"
              when AEC::LocalStorage::Required then "required"
              when AEC::LocalStorage::Excluded then "excluded"
              else
                raise Exception.new("unknown enum value for 'LocalStorage' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::LocalStorage
      value = pull.read_string
      case value
      when "included" then AEC::LocalStorage::Included
      when "required" then AEC::LocalStorage::Required
      when "excluded" then AEC::LocalStorage::Excluded
      else
        raise Exception.new("unknown enum value for 'LocalStorage' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::LocalStorage::Included then "included"
      when AEC::LocalStorage::Required then "required"
      when AEC::LocalStorage::Excluded then "excluded"
      else
        raise Exception.new("unknown enum value for 'LocalStorage' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::LocalStorage?
      case key
      when "included" then AEC::LocalStorage::Included
      when "required" then AEC::LocalStorage::Required
      when "excluded" then AEC::LocalStorage::Excluded
      else
        nil
      end
    end
  end
end
