private alias ASM = Amazonite::SecretsManagerV1

module Amazonite::SecretsManagerV1
  enum SortByType
    CreatedDate
    LastAccessedDate
    LastChangedDate
    Name

    def self.to_json(e : SortByType, json : JSON::Builder) : Nil
      value = case e
              when ASM::SortByType::CreatedDate      then "created-date"
              when ASM::SortByType::LastAccessedDate then "last-accessed-date"
              when ASM::SortByType::LastChangedDate  then "last-changed-date"
              when ASM::SortByType::Name             then "name"
              else
                raise Exception.new("unknown enum value for 'SortByType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ASM::SortByType
      value = pull.read_string
      case value
      when "created-date"       then ASM::SortByType::CreatedDate
      when "last-accessed-date" then ASM::SortByType::LastAccessedDate
      when "last-changed-date"  then ASM::SortByType::LastChangedDate
      when "name"               then ASM::SortByType::Name
      else
        raise Exception.new("unknown enum value for 'SortByType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ASM::SortByType::CreatedDate      then "created-date"
      when ASM::SortByType::LastAccessedDate then "last-accessed-date"
      when ASM::SortByType::LastChangedDate  then "last-changed-date"
      when ASM::SortByType::Name             then "name"
      else
        raise Exception.new("unknown enum value for 'SortByType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ASM::SortByType?
      case key
      when "created-date"       then ASM::SortByType::CreatedDate
      when "last-accessed-date" then ASM::SortByType::LastAccessedDate
      when "last-changed-date"  then ASM::SortByType::LastChangedDate
      when "name"               then ASM::SortByType::Name
      else
        nil
      end
    end
  end
end
