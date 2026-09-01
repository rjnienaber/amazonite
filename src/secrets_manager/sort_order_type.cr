private alias ASM = Amazonite::SecretsManager

module Amazonite::SecretsManager
  enum SortOrderType
    Asc
    Desc

    def self.to_json(e : SortOrderType, json : JSON::Builder) : Nil
      value = case e
              when ASM::SortOrderType::Asc  then "asc"
              when ASM::SortOrderType::Desc then "desc"
              else
                raise Exception.new("unknown enum value for 'SortOrderType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ASM::SortOrderType
      value = pull.read_string
      case value
      when "asc"  then ASM::SortOrderType::Asc
      when "desc" then ASM::SortOrderType::Desc
      else
        raise Exception.new("unknown enum value for 'SortOrderType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ASM::SortOrderType::Asc  then "asc"
      when ASM::SortOrderType::Desc then "desc"
      else
        raise Exception.new("unknown enum value for 'SortOrderType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ASM::SortOrderType?
      case key
      when "asc"  then ASM::SortOrderType::Asc
      when "desc" then ASM::SortOrderType::Desc
      else
        nil
      end
    end
  end
end
